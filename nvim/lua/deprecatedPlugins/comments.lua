return {

    {
    "danymat/neogen",
    ft = {"cpp","julia"},
    config = function()
            require('neogen').setup({
            })
            vim.keymap.set("n","<localleader>a", ':Neogen<CR>', {noremap=true,desc="generate [a]nnotation"})
        end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
},
}
