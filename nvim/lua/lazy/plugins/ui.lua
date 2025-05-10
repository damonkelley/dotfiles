return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "echasnovski/mini.icons" },
        opts = {},
        keys = {
            { "<Space>f", "<CMD>Fzf files<CR>",       desc = "Pick files" },
            { "<Space>b", "<CMD>Fzf buffers<CR>",     desc = "Pick buffers" },
            { "<Space>*", "<CMD>Fzf grep_cword<CR>",  desc = "Grep word" },
            { "<Space>*", "<CMD>Fzf grep_visual<CR>", mode = "v",              desc = "Grep selection" },
            { "<Space>/", "<CMD>Fzf live_grep<CR>",   desc = "Live pick files" },
            { "<Space>h", "<CMD>Fzf helptags<CR>",    desc = "Pick helptags" },
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {}
    }
}
