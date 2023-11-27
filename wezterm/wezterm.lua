local wezterm = require("wezterm")
local config = {}

config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9
config.automatically_reload_config = true

config.font = wezterm.font("CommitMono")
config.font_size = 13

-- init tmux by default
config.default_prog = {
  "/opt/homebrew/bin/fish",
  "-l",
  "-c",
  "tmux"
}

return config
