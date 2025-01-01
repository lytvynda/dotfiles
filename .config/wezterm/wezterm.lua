local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = {}

-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Maximize the window right away
wezterm.on('gui-startup', function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- Settings
config.color_scheme = "Batman"
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono NF", scale = 1.1, assume_emoji_presentation = true },
	{ family = "SauceCodePro NF", scale = 1.1, assume_emoji_presentation = true },
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"
-- config.default_domain = "WSL:Ubuntu-24.04"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.5,
}

-- Keys
config.leader = { key = "a", mods = "CTRL", timeout_miliseconds = 1500 }
config.keys = {
	-- Send C-w when pressing C-w twice
	{ key = "w", mods = "LEADER", action = act.SendKey({ key = "w", mods = "CTRL" }) },
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

	-- Pane keybindings
	{ key = "%", mods = "LEADER|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	{ key = "{", mods = "LEADER|SHIFT", action = act.RotatePanes("CounterClockwise") },
	{ key = "}", mods = "LEADER|SHIFT", action = act.RotatePanes("Clockwise") },

	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- Tab keybindings
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "&", mods = "LEADER|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "h", mods = "ALT|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = "ALT|SHIFT", action = act.ActivateTabRelative(1) },

	{ key = "w", mods = "LEADER", action = act.ShowTabNavigator },
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

config.enable_tab_bar = false
config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0.5cell",
	bottom = "0cell",
}

return config
