return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        direction = "float",
        float_opts = {
            border = "curved",
            width = function(term)
                return math.floor(vim.o.columns * 0.9)
            end,
            height = function(term)
                return math.floor(vim.o.lines * 0.9)
            end,
        },
        hidden = true,
        shade_terminals = true,
        start_in_insert = true,
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
        local Terminal = require('toggleterm.terminal').Terminal

        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { noremap = true, silent = true, desc = '' .. desc })
        end

        local mergeTables = function(t1, t2)
            local rc = {}
            for k, v in pairs(t1) do
                rc[k] = v
            end
            for k, v in pairs(t2) do
                rc[k] = v
            end
            return rc
        end

        local terminal = Terminal:new(mergeTables(opts, {
            -- function to run on opening the terminal
            on_open = function(term)
                vim.cmd("startinsert!")
            end,
            -- function to run on closing the terminal
            on_close = function(term)
                vim.cmd("startinsert!")
            end,
        }))
        local function _terminal_toggle()
            terminal:toggle()
        end
        map("<leader>pt", _terminal_toggle, "[P]review [T]erminal")

        local lazygit = Terminal:new(mergeTables(opts, {
            cmd = "lazygit",
            dir = "git_dir",
        }))
        local function _lazygit_toggle()
            lazygit:toggle()
        end

        map("<leader>pg", _lazygit_toggle, "[P]review Lazy[G]it")
    end
}
