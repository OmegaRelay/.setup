local M = {}

M.tmux = {
    n = {
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
        ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
        ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    }
}

M.general = {
  -- Insert mode mappings
  i = {
    ["jj"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },

  -- Visual mode mappings 
  v = {
    [";;"] = { "<ESC>", "escape visual mode" , opts = { nowait = true }},
  }
}

return M
