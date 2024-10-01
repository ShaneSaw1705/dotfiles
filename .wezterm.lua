-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.color_scheme = "MaterialDarker"
config.color_scheme = "Mathias"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 50

config.enable_tab_bar = false

config.initial_cols = 280
config.initial_rows = 85
config.window_decorations = "INTEGRATED_BUTTONS"

-- config.font = wezterm.font("Cascadia Code NF")
--
config.font = wezterm.font_with_fallback({
	-- Primary font for regular text
	{ family = "Cascadia Code", weight = "Bold" },

	-- Nerd Font for icons with scaling applied
	{ family = "Cascadia Code PL", scale = 1.5 }, -- Adjust the scale as needed
})

config.window_padding = {
	left = 20,
	right = 20,
	top = 60,
	bottom = 10,
}

config.font_size = 12

config.colors = {
	cursor_bg = "#FFFFFF", -- Gray cursor background
	cursor_fg = "#808080", -- White text color when the cursor is focused
	cursor_border = "#FFFFFF", -- Gray cursor border
}

return config
