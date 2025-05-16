local wezterm = require("wezterm")
local config = {}

config = wezterm.config_builder()

config = {
	default_cursor_style = "SteadyBar",
	automatically_reload_config = true,
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	font_size = 17,
	window_close_confirmation = "AlwaysPrompt",
	color_scheme = "Catppuccin Mocha (Gogh)",
	font = wezterm.font("Hack Nerd Font"),
	enable_tab_bar = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	background = {
		{
			source = {
				File = "/Users/ayush/Downloads/wallpaper-final.jpg",
			},
			hsb = {
				hue = 1.0,
				saturation = 1.02,
				brightness = 0.25,
			},
			-- attachment = { Parallax = 0.3 },
			-- width = "100%",
			-- height = "100%",
		},
	},
}

return config
