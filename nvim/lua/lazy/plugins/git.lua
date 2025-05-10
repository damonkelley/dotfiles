return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        keys = {
            {"<leader>gs", "<CMD>Neogit<CR>", desc = "Git Status"}
        }
    }
}
