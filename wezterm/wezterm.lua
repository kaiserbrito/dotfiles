local wezterm = require "wezterm"
local config = {}


config.check_for_updates = true
config.use_ime = true

----------------
-- Appearance --
----------------
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.automatically_reload_config = true
config.color_scheme = "Catppuccin Mocha"
config.window_padding = {
  left = 3,
  right = 3,
  top = 5,
  bottom = 3,
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.7,
}

config.initial_rows = 50
config.initial_cols = 140

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 3500
config.enable_scroll_bar = true

-----------
-- Fonts --
-----------
--disable_default_key_bindings = true,
--line_height = 1,
config.font = wezterm.font("MesloLGMDZ Nerd Font Mono")
config.font_size = 15

-----------
-- Keys  --
-----------
-- Rather than emitting fancy composed characters when alt is pressed, treat the
-- input more like old school ascii with ALT held down
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

return config
