local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- keys
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	-- copy mode
	{ key = "c", mods = "LEADER", action = wezterm.action.ActivateCopyMode },

	-- create vertical|horizontal panes
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- move between panes
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },

	-- manipulate panes
	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "m", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
	{ key = "r", mods = "LEADER", action = wezterm.action.ActivateKeyTable({ name = "resizePane", one_shot = false }) },

	-- manipulate tabs
	{ key = "n", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = wezterm.action.ShowTabNavigator },
}

config.key_tables = {
	resizePane = {
		{ key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- terminal window
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

-- color scheme
config.color_scheme = "Catppuccin Mocha"

-- font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12

return config
