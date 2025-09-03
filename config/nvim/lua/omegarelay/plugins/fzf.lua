return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},

    config = function()
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        local builtin = require('fzf-lua')

        map('<leader>ff', function()
            builtin.files({
                cwd_prompt = false,
                prompt = "Files❯ ",
                no_ignore = true
            })
        end, "[F]ind [F]ile")
        map('<leader>fs', function()
            builtin.live_grep({
                prompt = "Grep❯ ",
                no_ignore = true
            })
        end, "[F]ind [S]tring")
        map('<leader>fr', function()
            builtin.live_grep({
                resume = true,
                prompt = "Grep❯ "
            })
        end, "[F]ind [R]esume")
        map('<leader>fu', function()
            builtin.grep_cword({
                prompt = "Grep❯ ",
                no_ignore = true
            })
        end, "[F]ind [U]nder Cursor")

        map('<leader>fi', function()
            builtin.grep_cword({
                prompt = "Grep❯ ",
            })
        end, "[F]ind [I]n File")

        map('<leader>fgf', function()
            builtin.git_files({
                prompt = "Git Files❯ ",
            })
        end, "[F]ind [Git] [F]ile")
        map('<leader>fgd', function()
            builtin.git_diff({})
        end, "[F]ind [G]it [D]iff")
    end
}
