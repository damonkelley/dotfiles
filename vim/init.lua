require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "nvim-lua/plenary.nvim" })

	use({ "tpope/vim-vinegar" })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-unimpaired" })
	use({ "tpope/vim-commentary" })
	use({ "tpope/vim-repeat" })
	use({ "tpope/vim-fugitive" })

	use({ "vim-test/vim-test" })
	use({ "rcarriga/vim-ultest", run = ":UpdateRemotePlugins" })

	use({ "npxbr/gruvbox.nvim", branch = "main" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use({
		"TimUntersberger/neogit",
		requires = { { "nvim-lua/plenary.nvim" }, { "sindrets/diffview.nvim" } },
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
				},
			})
		end,
	})

	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = function()
			require("telescope").load_extension("fzf")
		end,
	})

	use({ "ThePrimeagen/harpoon" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({ "neoclide/coc.nvim", branch = "release"})
    use({ "fannheyward/telescope-coc.nvim",
        config = function()
          require('telescope').load_extension('coc')
        end
      })

	-- use({
	-- 	"neovim/nvim-lspconfig",
	-- 	requires = {
	-- 		{ "jose-elias-alvarez/null-ls.nvim" },
	-- 		{ "hrsh7th/cmp-nvim-lsp" },
	-- 		{ "hrsh7th/cmp-buffer" },
	-- 		{ "hrsh7th/cmp-path" },
	-- 		{ "hrsh7th/cmp-cmdline" },
	-- 		{ "hrsh7th/nvim-cmp" },
	-- 	},
	-- 	config = function()
	-- 		require("lsp")
	-- 	end,
	-- })
  --
    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
      }
    }

    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require("user")
require("treesitter")
require("tags").setup({ location = ".git/tags" })

require('refactoring').setup({})
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
