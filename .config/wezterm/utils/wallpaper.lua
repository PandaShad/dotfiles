local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

M.get_path_wallpaper = function(path)
	return {
		source = { File = { path = path } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
	}
end

M.get_wallpaper = function(dir)
	local glob = wezterm.glob(dir)
	local wallpaper = h.get_random_entry(glob)
	return {
		source = { File = { path = wallpaper } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
	}
end

return M
