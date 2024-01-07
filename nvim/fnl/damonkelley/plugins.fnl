(local lazy (require :lazy))


(local plugins [
                "folke/tokyonight.nvim"
                { 1 "akinsho/toggleterm.nvim"
                    :version "*"
                    :config #((. (require :toggleterm) :setup))}
                { 1 "nvim-lualine/lualine.nvim"
                    :config #((. (require :lualine) :setup))}
                "tpope/vim-commentary"
                "tpope/vim-surround"
                "tpope/vim-repeat"
                "tpope/vim-vinegar"
                "tpope/vim-unimpaired"
                "tpope/vim-sexp-mappings-for-regular-people"
                "guns/vim-sexp"
                "gpanders/nvim-parinfer"
                "hashivim/vim-terraform"
                { 1 "nvim-treesitter/nvim-treesitter" :build  ":TSUpdate"}
                "kdheepak/lazygit.nvim"
                "vim-test/vim-test"
                { 1 "nvim-telescope/telescope.nvim"
                 :version  "0.1.3"
                 :dependencies [ "nvim-lua/plenary.nvim"
                                 "BurntSushi/ripgrep"
                                 "sharkdp/fd"
                                 "nvim-tree/nvim-web-devicons"
                                { 1 "nvim-telescope/telescope-fzf-native.nvim" :build  "make"}]}
                { 1 "VonHeikemen/lsp-zero.nvim"
                 :branch "v3.x"
                 :dependencies [{ 1 "williamboman/mason.nvim"
                                  :config #((. (require :mason) :setup))}
                                { 1 "williamboman/mason-lspconfig.nvim"}
                                "neovim/nvim-lspconfig" 
                                "hrsh7th/cmp-nvim-lsp" 
                                "hrsh7th/nvim-cmp" 
                                { 1 "L3MON4D3/LuaSnip"
                                  :version  "v2.*"
                                  :build "make install_jsregexp"}]}  ;install jsregexp (optional!).
                        
                { 1 "elixir-tools/elixir-tools.nvim"
                  :version "*"
                  :dependencies [ "nvim-lua/plenary.nvim"]}

                "folke/trouble.nvim"
                "rktjmp/hotpot.nvim" 
                "Olical/conjure"])

(lazy.setup plugins)
