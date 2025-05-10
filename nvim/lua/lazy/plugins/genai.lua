return {
    {
        "yetone/avante.nvim",
        version      = "*",
        build        = "make",
        opts         = { provider = "copilot" },
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "zbirenbaum/copilot.lua"
        }
    }
}
