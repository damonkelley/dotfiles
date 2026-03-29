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
                auto_reload = true,
                server = {
                    toggle = false,
                    start = false,
                    stop = false,
                },
            }

            -- Required for `vim.g.opencode_opts.auto_reload`
            vim.opt.autoread = true

            -- Recommended/example keymaps
            vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask about this" })
            vim.keymap.set({ "n", "x" }, "<leader>op", function() require("opencode").ask("", { submit = true }) end, { desc = "Prompt opencode" })
            vim.keymap.set({ "n", "x" }, "<leader>o+", function() require("opencode").prompt("@this") end, { desc = "Add this" })
            vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end, { desc = "Select prompt" })
            vim.keymap.set("n", "<leader>oc", function() require("opencode").command() end, { desc = "Select command" })
            vim.keymap.set("n", "<leader>on", function() require("opencode").command("session_new") end, { desc = "New session" })
            vim.keymap.set("n", "<leader>oi", function() require("opencode").command("session_interrupt") end, { desc = "Interrupt session" })
            vim.keymap.set("n", "<leader>oA", function() require("opencode").command("agent_cycle") end, { desc = "Cycle selected agent" })
            vim.keymap.set("n", "<F8>",    function() require("opencode").command("messages_half_page_up") end, { desc = "Messages half page up" })
            vim.keymap.set("n", "<F9>",    function() require("opencode").command("messages_half_page_down") end, { desc = "Messages half page down" })
        end,
    },
    	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")

            -- For logging that is to a file if you wish to trace through requests
            -- for reporting bugs, i would not rely on this, but instead the provided
            -- logging mechanisms within 99.  This is for more debugging purposes
            local cwd = vim.uv.cwd()
            local basename = vim.fs.basename(cwd)
			_99.setup({
                -- provider = _99.Providers.ClaudeCodeProvider,  -- default: OpenCodeProvider
                model = "anthropic/claude-opus-4-6",
				logger = {
					type = "file",
					level = _99.DEBUG,
					path = "/tmp/" .. basename .. ".99.debug",
					print_on_error = true,
				},
                -- When setting this to something that is not inside the CWD tools
                -- such as claude code or opencode will have permission issues
                -- and generation will fail refer to tool documentation to resolve
                -- https://opencode.ai/docs/permissions/#external-directories
                -- https://code.claude.com/docs/en/permissions#read-and-edit
                tmp_dir = "./tmp",

                --- Completions: #rules and @files in the prompt buffer
                completion = {
                    -- I am going to disable these until i understand the
                    -- problem better.  Inside of cursor rules there is also
                    -- application rules, which means i need to apply these
                    -- differently
                    -- cursor_rules = "<custom path to cursor rules>"

                    --- A list of folders where you have your own SKILL.md
                    --- Expected format:
                    --- /path/to/dir/<skill_name>/SKILL.md
                    ---
                    --- Example:
                    --- Input Path:
                    --- "scratch/custom_rules/"
                    ---
                    --- Output Rules:
                    --- {path = "scratch/custom_rules/vim/SKILL.md", name = "vim"},
                    --- ... the other rules in that dir ...
                    ---
                    custom_rules = {
                      "scratch/custom_rules/",
                    },

                    --- Configure @file completion (all fields optional, sensible defaults)
                    files = {
                        -- enabled = true,
                        -- max_file_size = 102400,     -- bytes, skip files larger than this
                        -- max_files = 5000,            -- cap on total discovered files
                        -- exclude = { ".env", ".env.*", "node_modules", ".git", ... },
                    },
                    --- File Discovery:
                    --- - In git repos: Uses `git ls-files` which automatically respects .gitignore
                    --- - Non-git repos: Falls back to filesystem scanning with manual excludes
                    --- - Both methods apply the configured `exclude` list on top of gitignore

                    --- What autocomplete engine to use. Defaults to native (built-in) if not specified.
                    source = "blink", -- "native" (default), "cmp", or "blink"
                },

                --- WARNING: if you change cwd then this is likely broken
                --- ill likely fix this in a later change
                ---
                --- md_files is a list of files to look for and auto add based on the location
                --- of the originating request.  That means if you are at /foo/bar/baz.lua
                --- the system will automagically look for:
                --- /foo/bar/AGENT.md
                --- /foo/AGENT.md
                --- assuming that /foo is project root (based on cwd)
				md_files = {
					"AGENT.md",
				},
			})

            -- take extra note that i have visual selection only in v mode
            -- technically whatever your last visual selection is, will be used
            -- so i have this set to visual mode so i dont screw up and use an
            -- old visual selection
            --
            -- likely ill add a mode check and assert on required visual mode
            -- so just prepare for it now
			vim.keymap.set("v", "<leader>9v", function()
				_99.visual()
			end)

            --- if you have a request you dont want to make any changes, just cancel it
			vim.keymap.set("n", "<leader>9x", function()
				_99.stop_all_requests()
			end)

			vim.keymap.set("n", "<leader>9s", function()
				_99.search()
			end)

			local Worker = _99.Extensions.Worker
			vim.keymap.set("n", "<leader>9w", function()
				Worker.set_work()
			end)

			vim.keymap.set("n", "<leader>9W", function()
				Worker.search()
			end)
		end,
	},
    -- {
    --     "olimorris/codecompanion.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     opts = {
    --         interactions = {
    --             chat = {
    --                 adapter = "opencode",
    --             },
    --         },
    --     },
    --     keys = {
    --         { "<C-a>", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    --         { "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "CodeCompanion Chat" },
    --         { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to CodeCompanion" },
    --     },
    --     cmd = {
    --         "CodeCompanion",
    --         "CodeCompanionChat",
    --         "CodeCompanionCmd",
    --         "CodeCompanionActions",
    --     },
    -- },
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
    -- {
    --     "folke/sidekick.nvim",
    --     -- dependencies = { "folke/snacks.nvim", opts = {input = {}} },
    --     opts = {
    --         cli = {
    --             mux = {
    --                 backend = "tmux",
    --                 enabled = true,
    --                 -- create = "split"
    --             },
    --         },
    --     },
    --     keys = {
    --         {
    --             "<leader>a",
    --             nil,
    --             desc = "Sidekick"
    --         },
    --         {
    --             "<leader>aa",
    --             function()
    --                 -- if there is a next edit, jump to it, otherwise apply it if any
    --                 if not require("sidekick").nes_jump_or_apply() then
    --                     return "<Tab>" -- fallback to normal tab
    --                 end
    --             end,
    --             expr = true,
    --             desc = "Goto/Apply Next Edit Suggestion",
    --         },
    --         {
    --             "<c-.>",
    --             function() require("sidekick.cli").toggle() end,
    --             desc = "Sidekick Toggle",
    --             mode = { "n", "t", "i", "x" },
    --         },
    --         {
    --             "<leader>ac",
    --             function() require("sidekick.cli").toggle() end,
    --             desc = "Sidekick Toggle CLI",
    --         },
    --         {
    --             "<leader>as",
    --             function() require("sidekick.cli").select() end,
    --             -- Or to select only installed tools:
    --             -- require("sidekick.cli").select({ filter = { installed = true } })
    --             desc = "Select CLI",
    --         },
    --         {
    --             "<leader>ad",
    --             function() require("sidekick.cli").close() end,
    --             desc = "Detach a CLI Session",
    --         },
    --         {
    --             "<leader>a;",
    --             function()
    --                 require("snacks.input").input({}, function(value)
    --                     require("sidekick.cli").send({ msg = value, focus = true })
    --                 end)
    --             end,
    --             mode = { "x", "n" },
    --             desc = "Send text",
    --         },
    --         {
    --             "<leader>at",
    --             function() require("sidekick.cli").send({ msg = "{this}" }) end,
    --             mode = { "x", "n" },
    --             desc = "Send This",
    --         },
    --         {
    --             "<leader>af",
    --             function() require("sidekick.cli").send({ msg = "{file}" }) end,
    --             desc = "Send File",
    --         },
    --         {
    --             "<leader>av",
    --             function() require("sidekick.cli").send({ msg = "{selection}" }) end,
    --             mode = { "x" },
    --             desc = "Send Visual Selection",
    --         },
    --         {
    --             "<leader>ap",
    --             function() require("sidekick.cli").prompt() end,
    --             mode = { "n", "x" },
    --             desc = "Sidekick Select Prompt",
    --         },
    --         {
    --             "<leader>a!",
    --             function() require("sidekick.nes").apply() end,
    --             mode = { "n", "x" },
    --             desc = "Sidekick Apply",
    --         },
    --     },
    -- }
}
