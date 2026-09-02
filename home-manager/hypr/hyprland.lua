hl.monitor({
  output = "DP-2",
  mode = "3440x1440@180",
  position = "auto",
  scale = 1,
})
hl.monitor({ output="", mode="preferred", position="auto", scale=1 })



hl.config({
  input = {
    kb_layout = "gb",
    sensitivity = "-0.1",
    kb_options = "caps:hyper",
  },

  general = {
    gaps_in = 8,
    layout = "dwindle",
  },

  dwindle = {
    smart_split = true,
    preserve_split = true,
  },

  binds = {
    drag_threshold = 20,
    scroll_event_delay = 0,
  },

})



hl.bind("MOD3 + G", function()
  hl.dispatch(hl.dsp.exec_cmd("qs ipc call bar updateMode 'GRP'"))
  hl.dispatch(hl.dsp.submap("GRP"))
end, { submap_universal = true })

hl.bind("MOD3 + R", function()
  hl.dispatch(hl.dsp.exec_cmd("qs ipc call bar updateMode 'RSZ'"))
  hl.dispatch(hl.dsp.submap("RSZ"))
end, { separate = true, submap_universal = true })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, submap_universal = true })
hl.bind("SUPER + mouse_down", hl.dsp.layout("splitratio 0.05"), { submap_universal = true })
hl.bind("SUPER + mouse_up", hl.dsp.layout("splitratio -0.05"), { submap_universal = true })

hl.define_submap("NOR", function()
  hl.bind("ALT + F4", hl.dsp.window.close())

  hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
  hl.bind("SUPER + Space", hl.dsp.exec_cmd("rofi -show run"))

  hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "r+1" }))
  hl.bind("SUPER + SHIFT + Tab", hl.dsp.focus({ workspace = "r-1" }))

  -- not exactly completed. i'd like to make this better later
  hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))

  hl.bind("MOD3 + F", hl.dsp.window.fullscreen())
  hl.bind("MOD3 + P", hl.dsp.window.pseudo())

  hl.bind("SUPER + Hyper_L", hl.dsp.workspace.toggle_special(), { separate = true })

  -- hl.bind("CTRL + ALT + ALT_L", hl.dsp.pass({ window = "class:^(discord)$"}), { release = true })
  -- hl.bind("F12", hl.dsp.pass({ window = "class:^(discord)$"}), { release = true })

  -- hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
  -- hl.bind("SUPER + mouse_down", hl.dsp.layout("splitratio 0.05"))
  -- hl.bind("SUPER + mouse_up", hl.dsp.layout("splitratio -0.05"))

  hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))

  hl.bind("SUPER + F", function ()
    local current_workspace = hl.get_active_workspace()
    local is_floating = current_workspace.name == "floating"

    hl.dispatch(hl.dsp.workspace.rename({ workspace = current_workspace, name = is_floating and "" or "floating"}))

    for _, win in ipairs(hl.get_windows()) do
      if win.workspace == current_workspace then
        hl.dispatch(hl.dsp.window.float({ action = is_floating and "off" or "on", window = win }))
      end
    end
  end)
end)

hl.define_submap("GRP", function()
  hl.bind("Escape", function()
    hl.dispatch(hl.dsp.exec_cmd("qs ipc call bar updateMode 'NOR'"))
    hl.dispatch(hl.dsp.submap("NOR"))
  end)

end)

hl.define_submap("RSZ", function()
  hl.bind("Escape", function()
    hl.dispatch(hl.dsp.exec_cmd("qs ipc call bar updateMode 'NOR'"))
    hl.dispatch(hl.dsp.submap("NOR"))
  end)

  hl.bind("W", hl.dsp.window.resize({ x = 0, y = -125, relative = true }), { repeating = true })
  hl.bind("A", hl.dsp.window.resize({ x = -125, y = 0, relative = true }), { repeating = true })
  hl.bind("S", hl.dsp.window.resize({ x = 0, y = 125, relative = true }), { repeating = true })
  hl.bind("D", hl.dsp.window.resize({ x = 125, y = 0, relative = true }), { repeating = true })
end)

hl.on("hyprland.start", function ()
  hl.exec_cmd("easyeffects")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("quickshell")
  hl.exec_cmd("hyprctl dispatch 'hl.dsp.submap(\"NOR\")'")

  hl.exec_cmd("discord")
end)

hl.window_rule({
  match = { workspace = "name:floating" },
  float = true,
})

hl.window_rule({
  match = { class = "steam_app_.+" },
  workspace = "emptynm silent",
  float = false,
})

hl.window_rule({
  match = { title = "Forza Horizon 6" },
  fullscreen = 1,
})

hl.window_rule({
  match = { class = "zen" },
  focus_on_activate = true,
})

hl.window_rule({
  match = { class = "discord" },
  workspace = "special silent",
  pseudo = true,
})
