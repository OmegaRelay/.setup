local plugins = {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function ()
            return require "custom.configs.null-ls"
        end
    },
    {
        "tpope/vim-fugitive",
        lazy = false
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "cmake-language-server",
                "rust-analyzer",
            },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            git = {
                enable = true,
                ignore = false
            },
            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                    }
                }
            }
        }
    },
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        config = true,
    }
}

return plugins
