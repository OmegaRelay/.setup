return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function()
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { desc = 'Telescope: ' .. desc })
        end

        local builtin = require('telescope.builtin')
        map('<leader>ff', builtin.find_files, "[F]ind [F]iles")
        map('<leader>fg', builtin.git_files, "[F]ind [G]it files")
        map('<leader>fa', function()
            builtin.find_files({ no_ignore = true })
        end, "[F]ind [A]ll Files")
        map('<leader>fs', function()
            builtin.grep_string({
                no_ignore = true,
                search = vim.fn.input("grep > "),
            });
        end, "Find [S]tring in Workspace")
    end,
}
