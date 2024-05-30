local plugins = {
    {
        'glepnir/template.nvim',
        cmd = {'Template','TemProject'},
        config = function()
            require('template').setup({
                -- config in there
                temp_dir  = "~/.config/nvim/templates";
                author = "Theis Mejnertsen";
                email = "theismejnertsen@gmail.com";
            })
        end
    },
    {
        "kdheepak/lazygit.nvim",
    	cmd = {
    		"LazyGit",
    		"LazyGitConfig",
    		"LazyGitCurrentFile",
    		"LazyGitFilter",
    		"LazyGitFilterCurrentFile",
    	},
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        lazy = false
    },
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

    -- DAP
    {
        'rcarriga/nvim-dap-ui',
        event = "VeryLazy",
        dependencies = 'mfussenegger/nvim-dap',
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dap.listeners.before.attach.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
              dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
              dapui.close()
            end
        end
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            'mfussenegger/nvim-dap',
        },
        opts = {
            handlers = {},
        }
    },
    {
        'mfussenegger/nvim-dap',
        config = function ()
            require("core.utils").load_mappings("dap")
        end
    },
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        config = true,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "cmake-language-server",
                "rust-analyzer",
                "codelldb",
                "cmakelang",
                "cmakelint",
            },
        },
    }
}

return plugins
