local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use {'nvim-lua/plenary.nvim'}

  use { 'tpope/vim-vinegar'}
  use { 'tpope/vim-surround'}
  use {'tpope/vim-unimpaired'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-repeat'}

  use { 'vim-test/vim-test' }
  use { 'rcarriga/vim-ultest', run=':UpdateRemotePlugins' }

  use { 'neoclide/coc.nvim', branch='release' }
  use { 'npxbr/gruvbox.nvim', branch ='main' }
  use { 'nvim-treesitter/nvim-treesitter', run =':TSUpdate' }

  use {
    'TimUntersberger/neogit',
    requires={{'nvim-lua/plenary.nvim'}, {'sindrets/diffview.nvim' }},
    config = function()
      require('neogit').setup {
        integrations = {
          diffview = true
        }
      }
    end
  }

  use { 'kyazdani42/nvim-web-devicons' }

  use { 'nvim-telescope/telescope.nvim' }
  use { 'ThePrimeagen/harpoon' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
