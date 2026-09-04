local keyMod = "SUPER"
local keyVimLeft = "H"
local keyVimDown = "J"
local keyVimUp = "K"
local keyVimRight = "L"

local cmdTerminal = "alacritty"
local cmdBrowser = "zen-browser"
local cmdFileManager = "dolphin"
local cmdMenu = "wofi --show drun -I"
local cmdLockScreen = "hyprlock"
local cmdScreenShotSave = "hyprshot -m region --output-folder ~/Pictures/screenshots"
local cmdScreenShotCopy = "hyprshot -m region --clipboard-only"

hl.bind(keyMod .. " + ALT + SHIFT + M", hl.dsp.exit())

hl.bind(keyMod .. " + Q", hl.dsp.window.close())
hl.bind(keyMod .. " + F", hl.dsp.window.float())

hl.bind(keyMod .. " + ESCAPE", hl.dsp.exec_cmd(cmdLockScreen))
hl.bind(keyMod .. " + RETURN", hl.dsp.exec_cmd(cmdTerminal))
hl.bind(keyMod .. " + SPACE", hl.dsp.exec_cmd(cmdMenu))
hl.bind(keyMod .. " + B", hl.dsp.exec_cmd(cmdBrowser))
hl.bind(keyMod .. " + E", hl.dsp.exec_cmd(cmdFileManager))

hl.bind("PRINT", hl.dsp.exec_cmd(cmdScreenShotSave))
hl.bind(keyMod .. " + PRINT", hl.dsp.exec_cmd(cmdScreenShotCopy))
hl.bind(keyMod .. " + " .. keyVimLeft, hl.dsp.focus({ direction = "left" }))
hl.bind(keyMod .. " + " .. keyVimDown, hl.dsp.focus({ direction = "down" }))
hl.bind(keyMod .. " + " .. keyVimUp, hl.dsp.focus({ direction = "up" }))
hl.bind(keyMod .. " + " .. keyVimRight, hl.dsp.focus({ direction = "right" }))
hl.bind(keyMod .. " + SHIFT + " .. keyVimLeft, hl.dsp.window.move({ direction = "left" }))
hl.bind(keyMod .. " + SHIFT + " .. keyVimDown, hl.dsp.window.move({ direction = "down" }))
hl.bind(keyMod .. " + SHIFT + " .. keyVimUp, hl.dsp.window.move({ direction = "up" }))
hl.bind(keyMod .. " + SHIFT + " .. keyVimRight, hl.dsp.window.move({ direction = "right" }))
hl.bind(keyMod .. " + ALT + right", hl.dsp.window.resize({ x = 10, y = 0 }))
hl.bind(keyMod .. " + ALT + left", hl.dsp.window.resize({ x = -10, y = 0 }))
hl.bind(keyMod .. " + ALT + up", hl.dsp.window.resize({ x = 0, y = -10 }))
hl.bind(keyMod .. " + ALT + down", hl.dsp.window.resize({ x = 0, y = 10 }))
-- PATTERN: 10 sequential binds collapsed to loop
for i = 1, 10 do
    hl.bind(keyMod .. " + " .. (i % 10), hl.dsp.focus({ workspace = tostring(i % 10) }))
end

-- PATTERN: 10 sequential binds collapsed to loop
for i = 1, 10 do
    hl.bind(keyMod .. " + SHIFT + " .. (i % 10), hl.dsp.window.move({ workspace = tostring(i % 10) }))
end

hl.bind(keyMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(keyMod .. " + SHIFT + S", hl.dsp.focus({ workspace = "special:magic" }))
hl.bind(keyMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(keyMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(keyMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(keyMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = true })
