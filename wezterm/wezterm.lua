local wezterm = require("wezterm")
local config = {}

config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9
config.automatically_reload_config = true
config.send_composed_key_when_left_alt_is_pressed = true

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15
config.window_decorations = "RESIZE"

return config
