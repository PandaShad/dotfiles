return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
		local lazy_status = require("lazy.status")

        local mode = {
			"mode",
			-- separator = { left = "" },
			-- right_padding = 2,
			fmt = function(str)
				return " " .. str
			end,
		}

        local diff = {
			"diff",
			colored = true,
			symbols = {
				added = " ",
				modified = " ",
				removed = " ",
			},
		}

        local filename = {
			"filename",
			file_status = true,
			path = 0,
			symbols = {
				modified = "●",
				readonly = "",
				unnamed = "[Unnamed]",
				newfile = "[New]",
			},
		}

		local branch = {
			"branch",
			icon = "",
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			symbols = {
				error = " ",
				warn = " ",
				info = " ",
				hint = "󰌵 ",
			},
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

        lualine.setup({
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{ "encoding" },
					diagnostics,
				},
				lualine_y = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					"filetype",
					"progress",
				},
				lualine_z = {
					{ "location", left_padding = 2 },
				},
			},
		})
    end,
}
