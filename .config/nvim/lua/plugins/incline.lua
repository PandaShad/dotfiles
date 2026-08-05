return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	opts = {
		window = {
			margin = { vertical = 0, horizontal = 1 },
			padding = 1,
		},
		hide = { cursorline = "smart" },
		ignore = {
			filetypes = { "snacks_dashboard", "trouble", "oil" },
			unlisted_buffers = true,
			wintypes = "special",
		},
		render = function(props)
			local bufname = vim.api.nvim_buf_get_name(props.buf)
			local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"

			local icon, icon_hl = require("mini.icons").get("file", filename)

			local res = {
				{ icon, group = props.focused and icon_hl or "InclineNormalNC" },
				" ",
				{ filename, gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
			}

			if vim.bo[props.buf].modified then
				res[#res + 1] = { " \u{25cf}", group = "DiagnosticWarn" } -- ●
			end

			local signs = (vim.diagnostic.config() or {}).signs
			local sym = type(signs) == "table" and signs.text or {}
			local hl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticError",
				[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
				[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
				[vim.diagnostic.severity.HINT] = "DiagnosticHint",
			}
			for severity, count in pairs(vim.diagnostic.count(props.buf)) do
				if sym[severity] then
					res[#res + 1] = { " " .. sym[severity] .. count, group = hl[severity] }
				end
			end

			return res
		end,
	},
}
