return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" }
    },
    opts = {
        actions = {
            open_file = {
                quit_on_open = true,
                eject = false,
            },
            remove_file = {
                close_window = true,
            },
        },
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 100,
        },
        renderer = {
            group_empty = true,
            highlight_opened_files = "icon",
        },
        filters = {
            enable = false,
        },
        update_focused_file = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)

        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        local api = require("nvim-tree.api")

        map('<leader>t', api.tree.toggle, "[T]oggle File Tree")
    end
}
