return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function()
        require('telescope').setup({})

        -- local map = function(keys, func, desc, mode)
        --     mode = mode or 'n'
        --     vim.keymap.set(mode, keys, func, { desc = 'Telescope: ' .. desc })
        -- end
        --
        -- local builtin = require('telescope.builtin')
        --
        -- map('<leader>ff', function()
        --     builtin.find_files({ no_ignore = true })
        -- end, "[F]ind [F]ile")
        -- map('<leader>fg', builtin.git_files, "[F]ind [G]it file")
        -- map('<leader>fs', builtin.grep_string, "[F]ind [S]tring")
        -- map('<leader>fl', function()
        --     builtin.live_grep({
        --     })
        -- end, "[F]ind [L]ive String")
    end,
}
