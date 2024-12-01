local function functionDeclarationExistsInFile(cpp_filename, functionDeclarationToTest)
    -- Read the file content, concatenate into a single string, and parse it
    local file_content = vim.fn.readfile(cpp_filename)
    local fileString = table.concat(file_content)

    local parser = vim.treesitter.get_string_parser(table.concat(file_content),"cpp")
    local tree = parser:parse()
    local root_node = tree[1]:root()
    --pattern to look for is declaration -> init_declarator -> function_declarator
    for i = 0, root_node:named_child_count()-1, 1 do
        local nextChild = root_node:named_child(i)
        local nodeType = nextChild:type()
        local nodeText = vim.treesitter.get_node_text(nextChild,0)
        if nodeType == "declaration" then
            for j = 0, nextChild:named_child_count()-1,1 do 
                local subNode = nextChild:named_child(j)
                nodeType = subNode:type()
                nodeText = vim.treesitter.get_node_text(subNode,0)
                if nodeType == "init_declarator" then
                    for k = 0, subNode:named_child_count()-1,1 do 
                        local functionNode = subNode:named_child(k)
                        nodeType = functionNode:type()
                        nodeText = vim.treesitter.get_node_text(functionNode,fileString)
                        if nodeType == "function_declarator" then
                            local functionDeclaration = vim.treesitter.get_node_text(functionNode,fileString)
                            if functionDeclaration == functionDeclarationToTest then
                                return true
                            end
                        end
                    end
                end
            end
        end
    end

    return false
end

function append_function_signature_to_cpp()
    local className = "myClass"
    local returnType = "void"
    local functionDeclaration = ""

  -- Get the current line's TreeSitter node
    local current_node = vim.treesitter.get_node()
    --ascend the tree until we find a field_declaration
    while current_node do
        if tostring(current_node:type()) == 'field_declaration' then
            break
        end
        current_node =current_node:parent()
    end

    if not current_node then
        MiniNotify.add('Not inside a function declaration','INFO')
        return ""
    end


    local fieldDeclaration = current_node

    --get class name: ascend to the class specifier then find the type_identifier
    while current_node do
        if tostring(current_node:type()) == 'class_specifier' then
            break
        end
        current_node =current_node:parent()
    end
    for i = 0, current_node:named_child_count()-1, 1 do
        local childNode = current_node:named_child(i)
        if tostring(childNode:type()) == 'type_identifier' then
            className = vim.treesitter.get_node_text(childNode,0)
            break
        end
    end
    --
    -- MiniNotify.add(className,'WARN')

    for i = 0, fieldDeclaration:named_child_count()-1, 1 do
        local fieldChild = fieldDeclaration:named_child(i)
        local nodeType = fieldChild:type()
        if tostring(nodeType) == 'primitive_type' then
            returnType = vim.treesitter.get_node_text(fieldChild,0)
        end
        if tostring(nodeType) == 'function_declarator' then
            functionDeclaration = vim.treesitter.get_node_text(fieldChild,0)
        end
    end
    -- MiniNotify.add(returnType,'WARN')
    -- MiniNotify.add(functionDeclaration,'WARN')
    local signature = string.format(
        "%s %s::%s",returnType,className,functionDeclaration)
    -- MiniNotify.add(signature)

    local current_file = vim.fn.expand("%:p")
    local cpp_filename = current_file:gsub("%.h$", ".cpp")

    -- MiniNotify.add(current_file)
    -- MiniNotify.add(cpp_filename)

    local fileIsReadable = vim.fn.filereadable(cpp_filename)
    local file_content = {}
    -- if the file doesn't exist, include the header
    if fileIsReadable == 0  then
        -- MiniNotify.add("file not read")
        table.insert(file_content,"#include \"" ..vim.fn.expand("%").."\"")
    else
        -- MiniNotify.add("file read")
        local implementationAlreadyExists = functionDeclarationExistsInFile(cpp_filename,tostring(className.."::"..functionDeclaration))
        if implementationAlreadyExists then
            vim.notify("You've already written an implementation for that function")
            return false
        end

    end

    --append function implementation stub to the cpp file
    table.insert(file_content,"")
    table.insert(file_content, signature)
    table.insert(file_content, "    {")
    table.insert(file_content, "    };")
    vim.fn.writefile(file_content,cpp_filename,"a")
    -- vim.defer_fn(function() MiniNotify.clear() end, 10000)

end


vim.keymap.set("n", "<localleader>i", ":lua append_function_signature_to_cpp()<CR>:checktime<CR>",{desc = '[I]mplement class member declaration'})
