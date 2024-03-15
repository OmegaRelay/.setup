---@type ChadrcConfig
local M = {}

M.ui = { theme = 'catppuccin' }
M.ui.transparency = true
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

return M
