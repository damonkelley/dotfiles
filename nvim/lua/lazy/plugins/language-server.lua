return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "j-hui/fidget.nvim",
        opts = {}
    },
    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = 'rafamadriz/friendly-snippets',
        version = '1.*',
        opts = {
            keymap = { preset = 'default' },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
    }
}
