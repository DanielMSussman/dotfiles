local function appendSignatureToTable(contentToAppend,signature)
    table.insert(contentToAppend,"")
    table.insert(contentToAppend, signature)
    table.insert(contentToAppend, "    {")
    table.insert(contentToAppend, "    }")
end
local function fileIsOpenInBuffer(filename)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) == filename then
      return true
    end
  end
  return false
end
local function functionDeclarationExistsInFile(cppFilename, functionDeclarationToTest)
    -- Read the file content, concatenate into a single string, and parse it
    local fileContent = vim.fn.readfile(cppFilename)
    local fileString = table.concat(fileContent)

    local parser = vim.treesitter.get_string_parser(table.concat(fileContent),"cpp")
    local tree = parser:parse()
    local rootNode = tree[1]:root()

    --define a query for function_declarators
    -- local query = vim.treesitter.query.parse(
    --     "cpp",
    --     [[
    --   (declaration 
    --     (init_declarator 
    --       (function_declarator) @function_declarator))
    -- ]]
    -- )
    local query = vim.treesitter.query.parse(
        "cpp",
        [[
      (function_definition 
          (function_declarator) @function_declarator)
    ]]
    )
    -- Run the query on the parsed tree, and iterate over all matches
    local matches = query:iter_matches(rootNode:root(), fileString)
    for _, match in matches do
        for id, node in pairs(match) do
            if id == 1 then -- Check if it's the function_declarator node
                local functionDeclaration = vim.treesitter.get_node_text(node, fileString)
                if functionDeclaration == functionDeclarationToTest then
                    return true
                end
            end
        end
    end

    return false
end

local function conditionallyConstructSignature(fileIsReadable, contentToAppend,signature,cppFilename,classAndFunction) 
    local contentHolder = contentToAppend
    if fileIsReadable == 0 then
        vim.notify("adding "..classAndFunction.." to cpp file")
        appendSignatureToTable(contentHolder,signature)
    end 
    if fileIsReadable ~= 0 then
        if functionDeclarationExistsInFile(cppFilename,classAndFunction) then
            vim.notify("implementation for "..classAndFunction.." already written")
        else
            vim.notify("adding "..classAndFunction.." to cpp file")
            appendSignatureToTable(contentHolder,signature)
        end
    end
    return contentHolder
end


local function appendAllImplementationsToCPP()
    local currentFile = vim.fn.expand("%:p")
    local cppFilename = currentFile:gsub("%.h$", ".cpp")
    local className = "myClass"
    local returnType = "void"
    local functionDeclaration = ""
    local contentToAppend = {}

    -- if the file is not readable, include the header on the first line
    local fileIsReadable = vim.fn.filereadable(cppFilename)
    -- if the file doesn't exist, include the header
    if fileIsReadable == 0  then
        -- MiniNotify.add("file not read")
        table.insert(contentToAppend,"#include \"" ..vim.fn.expand("%").."\"")
    end

    -- get the class specifier we're sitting inside of
    local currentNode = vim.treesitter.get_node()
    while currentNode do
        if tostring(currentNode:type()) == 'class_specifier' then
            break
        end
        currentNode =currentNode:parent()
    end
    local classNode = currentNode
    if not classNode then
        vim.notify('Not inside a class')
        return ""
    end

    for i = 0, classNode:named_child_count()-1, 1 do
        local childNode = classNode:named_child(i)
        if tostring(childNode:type()) == 'type_identifier' then
            className = vim.treesitter.get_node_text(childNode,0)
            break
        end
    end

    -- from the class node, query for constructors and destructors
    local classQuery = vim.treesitter.query.parse(
        "cpp",
        [[
        (declaration
          (function_declarator) @function_declarator)
      ]]
    )
    local constructorMatches = classQuery:iter_matches(classNode:root(), 0)
    for _, match in constructorMatches do 
        local functionNode = match[1]
        local functionDeclarationText = vim.treesitter.get_node_text(functionNode,0)
        local classAndFunction = string.format("%s::%s",className,functionDeclarationText)
        contentToAppend = conditionallyConstructSignature(fileIsReadable,contentToAppend,classAndFunction,cppFilename,classAndFunction)
    end

    -- from the class node, query for pairs of types and function declarations
    --  By starting with field_declaration, we filter out cases where the
    --  implementation is in the header itself
    local query = vim.treesitter.query.parse(
        "cpp",
        [[
        (field_declaration
          (primitive_type) @primitive_type
          (function_declarator) @function_declarator)
      ]]
    )

    local matches = query:iter_matches(classNode:root(), 0)
    for _, match in matches do 
        local primitiveNode = match[1]
        local functionNode = match[2]
        local primitiveTypeText = vim.treesitter.get_node_text(primitiveNode,0)
        local functionDeclarationText = vim.treesitter.get_node_text(functionNode,0)
        local classAndFunction = string.format("%s::%s",className,functionDeclarationText)
        local signature = string.format("%s %s",primitiveTypeText,classAndFunction)
        contentToAppend = conditionallyConstructSignature(fileIsReadable,contentToAppend,signature,cppFilename,classAndFunction)
    end
    
    --append function implementation stub to the cpp file
    vim.fn.writefile(contentToAppend,cppFilename,"a")
    -- -- vim.defer_fn(function() MiniNotify.clear() end, 10000)
    -- refresh if the buffer is open
    if fileIsOpenInBuffer(cppFilename) then
        vim.cmd("checktime "..cppFilename)
    end
end

vim.api.nvim_create_user_command('ImplementClassMemberFunctions', function()
  appendAllImplementationsToCPP()
end, { desc = 'Implement class member declarations' })
vim.keymap.set("n", "<localleader>i", ":ImplementClassMemberFunction<CR>",{desc = '[I]mplement class member declarations'})
