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
  },

  general = {
    gaps_in = 8,
    layout = "dwindle",
  },

  dwindle = {
    smart_split = true,
    preserve_split = true,
  },
})
