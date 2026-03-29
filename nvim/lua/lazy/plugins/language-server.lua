return {
    "neovim/nvim-lspconfig",
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
    },
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
    },
    {
        'saghen/blink.compat',
        -- use v2.* for blink.cmp v1.*
        version = '2.*',
        -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
        lazy = true,
        -- make sure to set opts so that lazy.nvim calls blink.compat's setup
        opts = {},
    },
}
