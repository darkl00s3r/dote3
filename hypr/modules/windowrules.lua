--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.layer_rule({
    name = "notification-animations",
    match = { namespace = "swaync-control-center" },
    animation = "slide left"
})

local waybar_blur = hl.layer_rule({
    name         = "waybar",
    match        = { namespace = "waybar" },
    blur         = true,
    ignore_alpha = 0.5,
})
waybar_blur:set_enabled(false)

hl.window_rule({ match = { class = "blueman-manager" }, float = true, size = {600, 800} })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true, size = {900, 300}})
hl.window_rule({ match = { class = "org.nmrs.ui" }, float = true, size = {500, 800} })
hl.window_rule({ match = { class = "brave-browser" }, opaque = true,no_blur = true})
hl.window_rule({match = {class = "kitty"}, animation = "slidefade"})

hl.layer_rule({
    match = { namespace = "^rofi$" },
    animation = "popin 50%",
    blur = true,
})

hl.layer_rule({
    match = { namespace = "waybar" },
    animation = "popin 60%",
})

hl.config({
    general = {
        gaps_out = { top = 50, right = 15, bottom = 15, left = 15 },
    },
})



