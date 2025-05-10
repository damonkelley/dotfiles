return {
    {
        'stevearc/oil.nvim',
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        lazy = false,
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "-", ":Oil<CR>")
        end
    }
}
