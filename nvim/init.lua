local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

-- Bootstap hotpot into lazy plugin dir if it does not exist yet.
local hotpotpath = vim.fn.stdpath("data") .. "/lazy/hotpot.nvim"
if not vim.loop.fs_stat(hotpotpath) then
  vim.notify("Bootstrapping hotpot.nvim...", vim.log.levels.INFO)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    -- You may with to pin a known version tag with `--branch=vX.Y.Z`
    -- "--branch=v0.9.6", -- disabled to fix an error with lazy.nvim
    "https://github.com/rktjmp/hotpot.nvim.git",
    hotpotpath,
  })
end

-- As per lazy's install instructions, but insert hotpots path at the front
vim.opt.runtimepath:prepend({hotpotpath, lazypath})

require("hotpot") --

-- require('lazy').setup({
--     "folke/tokyonight.nvim",

--     {
--         "akinsho/toggleterm.nvim",
--         version = '*',
--         config = function() require("toggleterm").setup() end
--     },

--     {
--         'nvim-lualine/lualine.nvim',
--         config = function() require("lualine").setup() end
--     },

--     "tpope/vim-commentary",
--     "tpope/vim-surround",
--     "tpope/vim-repeat",
--     "tpope/vim-vinegar",
--     "tpope/vim-unimpaired",
--     "tpope/vim-sexp-mappings-for-regular-people",
--     "guns/vim-sexp",
--     "gpanders/nvim-parinfer",
--     "hashivim/vim-terraform",
--     { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
--     "kdheepak/lazygit.nvim",
--     "vim-test/vim-test",

--     {
--         'nvim-telescope/telescope.nvim',
--         version = '0.1.3',
--         dependencies = {
--             { 'nvim-lua/plenary.nvim' },
--             { 'BurntSushi/ripgrep' },
--             { 'sharkdp/fd' },
--             { 'nvim-tree/nvim-web-devicons' },
--             { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
--         }
--     },

--     {
--         'VonHeikemen/lsp-zero.nvim',
--         branch = 'v3.x',
--         dependencies = {
--             {
--                 'williamboman/mason.nvim',
--                 config = function() require('mason').setup() end
--             },
--             { 'williamboman/mason-lspconfig.nvim' },
--             { 'neovim/nvim-lspconfig' },
--             { 'hrsh7th/cmp-nvim-lsp' },
--             { 'hrsh7th/nvim-cmp' },
--             "L3MON4D3/LuaSnip",
--             version = "v2.*",
--             build = "make install_jsregexp" -- install jsregexp (optional!).
--         }
--     },


--     {
--         "elixir-tools/elixir-tools.nvim",
--         version = "*",
--         dependencies = { "nvim-lua/plenary.nvim", },
--     },

--     "folke/trouble.nvim",
--     { "rktjmp/hotpot.nvim" },
--     "Olical/conjure",

-- })

require("damonkelley.init")
