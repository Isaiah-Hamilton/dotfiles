local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12

-- color scheme
config.color_scheme = "Catppuccin Mocha"

-- terminal window
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

return config
