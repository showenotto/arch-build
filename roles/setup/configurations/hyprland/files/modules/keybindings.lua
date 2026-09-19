---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
-- ========== Applications ==========
-- Adjust the commands to match your actual apps
hl.bind(mainMod .. " + A",     			hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mainMod .. " + SPACE",      	hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B",          	hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + SHIFT + B",  	hl.dsp.exec_cmd("brave --incognito"))
hl.bind(mainMod .. " + E",          	hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + Z",          	hl.dsp.exec_cmd("dev.zed.Zed"))

-- ========== Utilities & programmes ==========
hl.bind(mainMod .. " + V",          	hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind(mainMod .. " + N",          	hl.dsp.exec_cmd("noctalia msg panel-toggle control-center notifications"))
hl.bind("Print",          				hl.dsp.exec_cmd("grim - | satty -f -"))
hl.bind(mainMod .. " + Print",          hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | satty -f -"))
hl.bind(mainMod .. " + O",          	hl.dsp.exec_cmd("noctalia msg panel-toggle alchemistaloha/noctalia-overview:overview"))

-- ========== Window Actions ==========
hl.bind(mainMod .. " + C",          hl.dsp.window.close())                       -- Close Window
hl.bind(mainMod .. " + M",          hl.dsp.window.fullscreen({ mode = "maximized" }))  -- Maximize
hl.bind(mainMod .. " + F",          hl.dsp.window.float({ action = "toggle" }))  -- Toggle Floating
hl.bind(mainMod .. " + Y", 	   hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + G", function() -- Toggle Tiling/Scrolling
    local ws = hl.get_active_special_workspace() or hl.get_active_workspace()
    if not ws then return end

    local next_layout = (ws.tiled_layout == "scrolling") and "dwindle" or "scrolling"

    if ws.special then
        hl.workspace_rule({ workspace = tostring(ws.name), layout = next_layout })
    else
        hl.workspace_rule({ workspace = tostring(ws.id), layout = next_layout })
    end
end)

-- ========== Window Navigation (focus) ==========
hl.bind(mainMod .. " + H",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J",          hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K",          hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L",          hl.dsp.focus({ direction = "right" }))

-- ========== Window Relocation (move window) ==========
hl.bind(mainMod .. " + ALT + H",    hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + ALT + J",    hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + ALT + K",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + ALT + L",    hl.dsp.window.move({ direction = "right" }))

-- ========== Window Resize ==========
-- Adjust the pixel delta (20) to your preference
local resize_step = 20   -- smaller = smoother continuous resize

hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({x=-resize_step, y = 0, relative=true}),{repeating = true})
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({x=0,y=resize_step,relative=true}),{repeating=true})
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({x=0,y=-resize_step,relative=true}),{repeating=true})
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({x=resize_step,y=0,relative=true}),{repeating=true})

-- ========== Move window to workspace ==========
hl.bind(mainMod .. " + SHIFT + H",  hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + J",  hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + K",  hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + L",  hl.dsp.window.move({ workspace = 4 }))

-- ========== Workspace Navigation ==========
hl.bind("ALT + H",                  hl.dsp.focus({ workspace = 1 }))
hl.bind("ALT + J",                  hl.dsp.focus({ workspace = 2 }))
hl.bind("ALT + K",                  hl.dsp.focus({ workspace = 3 }))
hl.bind("ALT + L",                  hl.dsp.focus({ workspace = 4 }))

-- ========== Session Management ==========
hl.bind("CTRL + ALT + L",           hl.dsp.exec_cmd("hyprlock"))                 -- Lock Screen (or loginctl lock-session)
hl.bind("CTRL + ALT + END",         hl.dsp.exec_cmd("uwsm stop || hyprctl dispatch exit"))  -- Logout (prefer uwsm if you use it)
hl.bind("CTRL + ALT + UP",          hl.dsp.exec_cmd("systemctl reboot"))         -- Restart
hl.bind("CTRL + ALT + DOWN",        hl.dsp.exec_cmd("systemctl poweroff"))       -- Shutdown

-- ========== Hyprland Defaults ==========

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow=false}))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
