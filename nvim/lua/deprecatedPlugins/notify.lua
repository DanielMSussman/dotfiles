return{
    {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
        local notify = require("notify").setup({
            })
    end
    },
}
