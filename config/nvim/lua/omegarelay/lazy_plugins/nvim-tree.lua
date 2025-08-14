return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        {"nvim-tree/nvim-web-devicons"}
    },
    opts = {
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            enable = false,
        },
    },
    config = function (_, opts)
        require("nvim-tree").setup(opts)

        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        local api = require("nvim-tree.api")

        map('<leader>t', api.tree.toggle, "[T]oggle File Tree")
    end
}
