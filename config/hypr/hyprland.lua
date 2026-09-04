-- hyprland.lua

require("hyprland.config")
require("hyprland.binds")
require("hyprland.style")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- hl.workspace_rule({ workspace = "100" })
-- hl.workspace_rule({ workspace = "false" })

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("systemctl --user start hypridle pa-notify")
end)
