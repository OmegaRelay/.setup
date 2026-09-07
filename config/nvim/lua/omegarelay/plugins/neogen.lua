return {
    "danymat/neogen",
    version = "*",
    opts = {
        snippet_engine = "nvim",
    },
    config = function(_, opts)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        local neogen = require("neogen")
        neogen.setup(opts)

        map("<leader>gx", function()
            neogen.generate({})
        end, "[G]enerate Docstring")
    end,
}
