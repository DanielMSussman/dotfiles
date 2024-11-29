function append_function_signature_to_cpp()
    local className = "myClass"
    local returnType = "void"
    local functionDeclaration = ""

  -- Get the current line's TreeSitter node
    local current_node = vim.treesitter.get_node()
    -- local id = MiniNotify.add('inspection: '..tostring(current_node:type()),'INFO')
    -- vim.defer_fn(function() MiniNotify.clear() end, 5000)
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

    local file_content = {}
    if vim.fn.filereadable(cpp_filename) == 0 then
        table.insert(file_content,"#include \"" ..vim.fn.expand("%").."\"")
    end
    table.insert(file_content,"")
    table.insert(file_content, signature)
    table.insert(file_content, "    {")
    table.insert(file_content, "    };")
    vim.fn.writefile(file_content,cpp_filename,"a")

    end


vim.keymap.set("n", "<localleader>i", ":lua append_function_signature_to_cpp()<CR>:checktime<CR>",{desc = '[I]mplement class member declaration'})
