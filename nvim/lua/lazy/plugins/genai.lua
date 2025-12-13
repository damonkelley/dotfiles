return {
    {
        "NickvanDyke/opencode.nvim",
        dependencies = {
            -- Recommended for `ask()` and `select()`.
            -- Required for `toggle()`.
            { "folke/snacks.nvim", opts = { input = {}, picker = {} } },
        },
        config = function()
            vim.g.opencode_opts = {
                auto_reload = true
                -- Your configuration, if any — see `lua/opencode/config.lua`
            }

            -- Required for `vim.g.opencode_opts.auto_reload`
            vim.opt.autoread = true

            -- Recommended/example keymaps
            vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask about this" })
            vim.keymap.set({ "n", "x" }, "<leader>o+", function() require("opencode").prompt("@this") end, { desc = "Add this" })
            vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end, { desc = "Select prompt" })
            vim.keymap.set("n", "<leader>ot", function() require("opencode").toggle() end, { desc = "Toggle embedded" })
            vim.keymap.set("n", "<leader>oc", function() require("opencode").command() end, { desc = "Select command" })
            vim.keymap.set("n", "<leader>on", function() require("opencode").command("session_new") end, { desc = "New session" })
            vim.keymap.set("n", "<leader>oi", function() require("opencode").command("session_interrupt") end, { desc = "Interrupt session" })
            vim.keymap.set("n", "<leader>oA", function() require("opencode").command("agent_cycle") end, { desc = "Cycle selected agent" })
            vim.keymap.set("n", "<F8>",    function() require("opencode").command("messages_half_page_up") end, { desc = "Messages half page up" })
            vim.keymap.set("n", "<F9>",    function() require("opencode").command("messages_half_page_down") end, { desc = "Messages half page down" })
        end,
    },
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        config = true,
        lazy = false,
        opts = {
            terminal_cmd = "tmux split-window -h claude"
        },
        keys = {
            { "<leader>c", nil, desc = "AI/Claude Code" },
            { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
            { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
            { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
            { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
            { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
            { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
            { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
            {
                "<leader>cs",
                "<cmd>ClaudeCodeTreeAdd<cr>",
                desc = "Add file",
                ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
            },
            -- Diff management
            { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
            { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
        },
    },
    {
        "folke/sidekick.nvim",
        -- dependencies = { "folke/snacks.nvim", opts = {input = {}} },
        opts = {
            cli = {
                mux = {
                    backend = "tmux",
                    enabled = true,
                    -- create = "split"
                },
            },
        },
        keys = {
            {
                "<leader>a",
                nil,
                desc = "Sidekick"
            },
            {
                "<leader>aa",
                function()
                    -- if there is a next edit, jump to it, otherwise apply it if any
                    if not require("sidekick").nes_jump_or_apply() then
                        return "<Tab>" -- fallback to normal tab
                    end
                end,
                expr = true,
                desc = "Goto/Apply Next Edit Suggestion",
            },
            {
                "<c-.>",
                function() require("sidekick.cli").toggle() end,
                desc = "Sidekick Toggle",
                mode = { "n", "t", "i", "x" },
            },
            {
                "<leader>ac",
                function() require("sidekick.cli").toggle() end,
                desc = "Sidekick Toggle CLI",
            },
            {
                "<leader>as",
                function() require("sidekick.cli").select() end,
                -- Or to select only installed tools:
                -- require("sidekick.cli").select({ filter = { installed = true } })
                desc = "Select CLI",
            },
            {
                "<leader>ad",
                function() require("sidekick.cli").close() end,
                desc = "Detach a CLI Session",
            },
            {
                "<leader>a;",
                function()
                    require("snacks.input").input({}, function(value)
                        require("sidekick.cli").send({ msg = value, focus = true })
                    end)
                end,
                mode = { "x", "n" },
                desc = "Send text",
            },
            {
                "<leader>at",
                function() require("sidekick.cli").send({ msg = "{this}" }) end,
                mode = { "x", "n" },
                desc = "Send This",
            },
            {
                "<leader>af",
                function() require("sidekick.cli").send({ msg = "{file}" }) end,
                desc = "Send File",
            },
            {
                "<leader>av",
                function() require("sidekick.cli").send({ msg = "{selection}" }) end,
                mode = { "x" },
                desc = "Send Visual Selection",
            },
            {
                "<leader>ap",
                function() require("sidekick.cli").prompt() end,
                mode = { "n", "x" },
                desc = "Sidekick Select Prompt",
            },
            {
                "<leader>a!",
                function() require("sidekick.nes").apply() end,
                mode = { "n", "x" },
                desc = "Sidekick Apply",
            },
        },
    }
}
