local wezterm = require("wezterm")
local config = {}

config.color_scheme = 'Gruvbox Dark (Gogh)'

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13

-- init tmux by default
config.default_prog = {
  "/opt/homebrew/bin/fish",
  "-l",
  "-c",
  "tmux"
}

return config
