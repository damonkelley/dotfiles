local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use "folke/tokyonight.nvim"

  use "Olical/aniseed"
  use "Olical/conjure"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "tpope/vim-vinegar"
  use "tpope/vim-unimpaired"
  use "tpope/vim-sexp-mappings-for-regular-people"
  use "guns/vim-sexp"
  use "gpanders/nvim-parinfer"
  use "hashivim/vim-terraform"
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use "kdheepak/lazygit.nvim"

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'BurntSushi/ripgrep' },
      {'sharkdp/fd'},
      {'nvim-tree/nvim-web-devicons'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    }
  }

  use "jose-elias-alvarez/null-ls.nvim"


  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},
      {'jay-babu/mason-null-ls.nvim'},
      {'jose-elias-alvarez/null-ls.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.g["aniseed#env"] = { module = "damonkelley.init", compile = true }