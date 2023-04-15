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

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- use({ "neoclide/coc.nvim", branch = "release" })
	-- use({
	-- 	"fannheyward/telescope-coc.nvim",
	-- 	config = function()
	-- 		require("telescope").load_extension("coc")
	-- 	end,
	-- })
  --
    use({"hrsh7th/nvim-cmp" ,
      requires = {
        { "jose-elias-alvarez/null-ls.nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "PaterJason/cmp-conjure" },
      }
    })

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp")
		end,
	})

	use("folke/tokyonight.nvim")

	use({
		"MunifTanjim/exrc.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.o.exrc = false
			require("exrc").setup({
				files = {
					".nvimrc.lua",
					".nvimrc",
					".exrc.lua",
					".exrc",
				},
			})
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("earthly/earthly.vim")
	use("jxnblk/vim-mdx-js")
    use('JoosepAlviste/nvim-ts-context-commentstring')

    use({'Olical/conjure'})
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

require("user")
require("treesitter")
require("tags").setup({ location = ".git/tags" })
