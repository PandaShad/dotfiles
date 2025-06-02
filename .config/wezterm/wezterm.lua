local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- [COLOR SCHEME]
config.color_scheme = "Catppuccin Mocha"

-- [WINDOW]
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
	left = 18,
	right = 15,
	top = 20,
	bottom = 5,
}

-- [FONTS]
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.harfbuzz_features = { "calt=0" }

-- [GRAPHICS]
config.max_fps = 120
config.animation_fps = 120
config.front_end = "WebGpu"
config.prefer_egl = true

-- [BELL]
config.audible_bell = "Disabled"

-- [BACKGROUND]
config.window_background_opacity = 0.85

config.background = {
	{
		source = {
			File = "C:\\Users\\maxime.bellet\\Pictures\\Wallpaper\\wallhaven-2ye9jm_2560x1440.png",
		},
		width = "Cover",
		height = "Cover",
		opacity = 1,
	},
	{
		source = {
			Color = "#1e1e2e",
		},
		width = "100%",
		height = "100%",
		opacity = 0.75,
	},
}

-- [WSL]
config.default_domain = "WSL:Ubuntu"

return config
