(local nvim (require :damonkelley.nvim))

(fn plugin [name options]
  (do (tset options 1 name) options))

(local plugins [(plugin "folke/tokyonight.nvim" {})
                (plugin "Mofiqul/adwaita.nvim" {:lazy false :priority 1000})
                (plugin "savq/melange-nvim" {})
                (plugin "rose-pine/neovim" {:name "rose-pine"})

                (plugin "tpope/vim-commentary" {})
                (plugin "kylechui/nvim-surround" {
                        :version "*"
                        :event "VeryLazy"
                        :config #((. (require :nvim-surround) :setup))})
                (plugin "tpope/vim-repeat" {})
                (plugin "tpope/vim-unimpaired" {})

                (plugin "ThePrimeagen/harpoon" {:dependencies [(plugin "nvim-lua/plenary.nvim" {})]
                                                :branch "harpoon2"
                                                :config #((. (require :harpoon) :setup))})

                (plugin "folke/which-key.nvim" {:event "VeryLazy"
                                                :init (fn [] 
                                                        (do 
                                                          (nvim.opt :timeout true)
                                                          (nvim.opt :timeoutlen 300)))})

                (plugin "MeanderingProgrammer/markdown.nvim" 
                        {:ft ["markdown" "Avante"]
                         :opts {:file_types ["markdown" "Avante"]}})

                (plugin "stevearc/oil.nvim" {:config true})

                (plugin "julienvincent/nvim-paredit" {:config #((. (require :nvim-paredit) :setup))})
                (plugin "echasnovski/mini.nvim" {:version "*" :config #((. (require :mini.pairs) :setup))})

                (plugin "apple/pkl-neovim" {})
                (plugin "nvim-treesitter/nvim-treesitter" {:build  ":TSUpdate"})
                (plugin "vim-test/vim-test" {})
                (plugin "akinsho/toggleterm.nvim" {:config #((. (require :toggleterm) :setup))})
                (plugin "rktjmp/hotpot.nvim" {}) 

                (plugin "NeogitOrg/neogit"
                        {:dependencies ["nvim-lua/plenary.nvim" "sindrets/diffview.nvim"]
                         :config true})

                (plugin "Olical/conjure" {:branch "main"
                                          :dependencies [(plugin "Olical/AnsiEsc" {})
                                                         (plugin "m00qek/baleia.nvim" {:config #((. (require :baleia) :setup))})]})

                (plugin "Olical/nfnl" {:ft "fennel"})

                (plugin "nvim-lualine/lualine.nvim"
                        {:config #((. (require :lualine) :setup))})

                (plugin "ibhagwan/fzf-lua" {:dependencies (plugin "nvim-tree/nvim-web-devicons" {})
                                            :config #((. (require :fzf-lua) :setup))})

                (plugin "hrsh7th/nvim-cmp"
                        {:dependencies [(plugin "hrsh7th/cmp-buffer" {})
                                        (plugin "hrsh7th/cmp-path" {})
                                        (plugin "hrsh7th/cmp-cmdline" {})]})

                (plugin "neovim/nvim-lspconfig"
                        {:dependencies [(plugin "williamboman/mason.nvim"
                                          {:config #((. (require :mason) :setup)
                                           {:registries ["github:nvim-java/mason-registry"
                                                               "github:mason-org/mason-registry"]})})
                                        (plugin "williamboman/mason-lspconfig.nvim" {})
                                        (plugin "neovim/nvim-lspconfig" {}) 
                                        (plugin "hrsh7th/cmp-nvim-lsp" {}) 
                                        (plugin "j-hui/fidget.nvim" {})
                                        (plugin "L3MON4D3/LuaSnip"
                                          {:version  "v2.*"
                                           :build "make install_jsregexp"})]})  ;install jsregexp (optional!).

                (plugin "nvim-java/nvim-java" {:dependencies [(plugin "nvim-java/lua-async-await" {})
                                                              (plugin  "nvim-java/nvim-java-refactor" {})
                                                              (plugin "nvim-java/nvim-java-core" {})
                                                              (plugin "nvim-java/nvim-java-test" {})
                                                              (plugin "nvim-java/nvim-java-dap" {})
                                                              (plugin "MunifTanjim/nui.nvim" {})
                                                              (plugin "mfussenegger/nvim-dap" {})
                                                              (plugin "neovim/nvim-lspconfig" {})
                                                              (plugin "williamboman/mason.nvim" {:opts {:registries ["github:nvim-java/mason-registry"
                                                                                                                     "github:mason-org/mason-registry"]}})
                                                              ]})

                (plugin "elixir-tools/elixir-tools.nvim"
                        {:version "*"
                         :dependencies [(plugin "nvim-lua/plenary.nvim" {})]})


                ; (plugin "olimorris/codecompanion.nvim"
                ;         {:dependencies [(plugin "nvim-lua/plenary.nvim" {})
                ;                         (plugin "nvim-treesitter/nvim-treesitter" {})]})


                (plugin "yetone/avante.nvim"
                        {:event "VeryLazy"
                        :version "*"
                        :build "make"
                        :opts {:provider "copilot"
                        :dependencies [(plugin "stevearc/dressing.nvim" {})
                                       (plugin "nvim-lua/plenary.nvim" {})
                                       (plugin "MunifTanjim/nui.nvim" {})
                                       (plugin "zbirenbaum/copilot.lua" {})]}})

                ])



(let [lazy (require :lazy)]
  (lazy.setup plugins))
