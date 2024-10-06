-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.color_scheme = "MaterialDarker"
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 50

config.enable_tab_bar = false

config.initial_cols = 280
config.initial_rows = 75
config.window_decorations = "INTEGRATED_BUTTONS"

config.font = wezterm.font("JetbrainsMono Nerd Font")

-- config.font = wezterm.font_with_fallback({
-- 	-- Primary font for regular text
-- 	{ family = "Cascadia Code", weight = "Bold" },
--
-- 	-- Nerd Font for icons with scaling applied
-- 	{ family = "Cascadia Code PL", scale = 1.5 }, -- Adjust the scale as needed
-- })

config.window_padding = {
	left = 20,
	right = 20,
	top = 60,
	bottom = 10,
}

config.font_size = 12

-- config.colors = {
-- 	cursor_bg = "#FFFFFF", -- Gray cursor background
-- 	cursor_fg = "#808080", -- White text color when the cursor is focused
-- 	cursor_border = "#FFFFFF", -- Gray cursor border
-- }
config.colors = {
	foreground = "#DED7D0",
	background = "#1E1D23",

	selection_fg = "#1A1B1F",
	selection_bg = "#CFD0D7",

	cursor_bg = "#DFE0EA",
	cursor_fg = "#1E1D23", -- Sets cursor text color to match the background
	cursor_border = "#DFE0EA",

	tab_bar = {
		background = "#342D3B", -- Inactive tabs background
		active_tab = {
			bg_color = "#E85A84",
			fg_color = "#DFE0EA",
			intensity = "Bold", -- Active tab style
		},
		inactive_tab = {
			bg_color = "#342D3B",
			fg_color = "#CFD0D7",
			italic = true, -- Inactive tab style
		},
	},

	-- Colors
	ansi = {
		"#938884", -- Black
		"#FF7DA3", -- Red
		"#7EC49D", -- Green
		"#EFD472", -- Yellow
		"#8BB8D0", -- Blue
		"#BDA9D4", -- Magenta
		"#BDA9D4", -- Cyan
		"#DED7D0", -- White
	},
	brights = {
		"#938884", -- Bright Black
		"#FF7DA3", -- Bright Red
		"#7EC49D", -- Bright Green
		"#EFD472", -- Bright Yellow
		"#8BB8D0", -- Bright Blue
		"#BDA9D4", -- Bright Magenta
		"#BDA9D4", -- Bright Cyan
		"#DED7D0", -- Bright White
	},
}

return config
