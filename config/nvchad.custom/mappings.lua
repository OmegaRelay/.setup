local M = {}

M.tmux = {
    n = {
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
        ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
        ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    }
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] =
            {"<cmd> DapToggleBreakpoint<CR>", "DAP toggle breakpoint"},
        ["<leader>dr"] =
            {"<cmd> DapContinue<CR>", "DAP continue"},
        ["<leader>do"] =
            {"<cmd> DapStepOver<CR>", "DAP step over"},
        ["<leader>dj"] =
            {"<cmd> DapStepInto<CR>", "DAP step into"},
        ["<leader>dk"] =
            {"<cmd> DapStepOut<CR>", "DAP step out"},
    }
}

M.git = {
  n = {
    ["<leader>gp"] =
        {"<cmd> Gitsigns preview_hunk<CR>", "git: preview change"},
    ["<leader>gr"] =
        {"<cmd> Gitsigns reset_hunk<CR>", "git: reset hunk"},
    ["<leader>gb"] =
        {"<cmd> Gitsigns toggle_current_line_blame<CR>", "git: toggle line blame"},
    ["<leader>gd"] =
        {"<cmd> Gitsigns diffthis<CR>", "git: open diff"},
    ["<leader>lg"] =
        {"<cmd>LazyGit<cr>", "open LazyGit" }
  }
}

M.general = {
    t = {
        ["<C-n>"] = { "<C-\\><C-n>", "escape terminal" , opts = { nowait = true }},
    },

    n = {
        [";"] = { ":", "enter command mode" , opts = { nowait = true }},
    },
    -- Insert mode mappings
    i = {
        ["jj"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
        ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    },

    -- Visual mode mappings 
    v = {
        [";"] = { "<ESC>", "escape visual mode" , opts = { nowait = true }},
    }
}

return M
