return {
    "folke/todo-comments.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua",
    },
    opts = function()
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        local todo_fzf = require("todo-comments.fzf")

        map('<leader>ft', function()
            todo_fzf.todo({
                cwd_prompt = false,
                prompt = "TODO❯ ",
            })
        end, "[F]ind [T]odo")
    end
}
