hl.config({
    general = {
        allow_tearing = true,
        border_size = 2,
        col = {
            active_border = {
                colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
                angle = 45
            },
            inactive_border = "rgba(595959aa)",
        },
        gaps_in = 5,
        gaps_out = 20,
        layout = "dwindle",
        resize_on_border = true,
    },
    decoration = {
        active_opacity = 1.0,
        blur = {
            enabled = true,
            passes = 1,
            size = 3,
            vibrancy = 0.1696,
        },
        inactive_opacity = 0.9,
        rounding = 10,
        rounding_power = 2,
        shadow = {
            color = "rgba(1a1a1aee)",
            enabled = true,
            range = 4,
            render_power = 3,
        },
    },
    input = {
        follow_mouse = 2,
        kb_layout = "us",
        kb_model = "",
        kb_options = "ctrl:nocaps",
        kb_rules = "",
        kb_variant = "",
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
        },
    },
    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = -1,
        key_press_enables_dpms = true,
        mouse_move_enables_dpms = true,
        session_lock_xray = true,
    },
    cursor = {
        no_warps = true,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    animations = {
        enabled = true,
    },
})
