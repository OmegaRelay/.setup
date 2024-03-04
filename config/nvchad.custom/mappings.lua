local mappings = {}

mappings.abc = {
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

return mappings
