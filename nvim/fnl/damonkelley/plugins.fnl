(local lazy (require :lazy))

(fn plugin [name options]
  (do (tset options 1 name) options))

(local plugins [
                (plugin "folke/tokyonight.nvim" {})
                (plugin "rose-pine/neovim" {:name "rose-pine"})
                (plugin "akinsho/toggleterm.nvim"
                    {:version "*"
                     :config #((. (require :toggleterm) :setup))})
                (plugin "nvim-lualine/lualine.nvim"
                    {:config #((. (require :lualine) :setup))})
                (plugin "tpope/vim-commentary" {})
                (plugin "tpope/vim-surround" {})
                (plugin "tpope/vim-repeat" {})
                (plugin "tpope/vim-vinegar" {})
                (plugin "tpope/vim-unimpaired" {})
                (plugin "tpope/vim-sexp-mappings-for-regular-people" {})
                (plugin "guns/vim-sexp" {})
                (plugin "gpanders/nvim-parinfer" {})
                (plugin "hashivim/vim-terraform" {})
                (plugin "nvim-treesitter/nvim-treesitter" {:build  ":TSUpdate"})
                (plugin "kdheepak/lazygit.nvim" {})
                (plugin "vim-test/vim-test" {})
                (plugin "nvim-telescope/telescope.nvim"
                 {:version  "0.1.3"
                  :dependencies [(plugin "nvim-lua/plenary.nvim" {})
                                 (plugin "BurntSushi/ripgrep" {})
                                 (plugin "sharkdp/fd" {})
                                 (plugin "nvim-tree/nvim-web-devicons" {})
                                 (plugin "nvim-telescope/telescope-fzf-native.nvim" {:build  "make"})]})
                (plugin "VonHeikemen/lsp-zero.nvim"
                 {:branch "v3.x"
                  :dependencies [(plugin "williamboman/mason.nvim"
                                   {:config #((. (require :mason) :setup))})
                                 (plugin "williamboman/mason-lspconfig.nvim" {})
                                 (plugin "neovim/nvim-lspconfig" {}) 
                                 (plugin "hrsh7th/cmp-nvim-lsp" {}) 
                                 (plugin "hrsh7th/nvim-cmp" {}) 
                                 (plugin "L3MON4D3/LuaSnip"
                                   {:version  "v2.*"
                                    :build "make install_jsregexp"})]})  ;install jsregexp (optional!).
                        
                (plugin "elixir-tools/elixir-tools.nvim"
                  {:version "*"
                   :dependencies [ "nvim-lua/plenary.nvim"]})

                (plugin "folke/trouble.nvim" {})
                (plugin "rktjmp/hotpot.nvim" {}) 
                (plugin "Olical/conjure" {})])

(lazy.setup plugins)
