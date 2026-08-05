return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local signs = (vim.diagnostic.config() or {}).signs
		local sym = type(signs) == "table" and signs.text or {}

		return {
			options = {
				theme = "auto",
				globalstatus = true,
				component_separators = { left = "\u{2502}", right = "\u{2502}" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "snacks_dashboard" },
				},
			},
			sections = {
				lualine_a = { { "mode", icon = "\u{f165d}" } }, -- 󱙝 nf-md-ghost_outline
				lualine_b = {
					"branch",
					{
						"diff",
						source = function()
							local gs = vim.b.gitsigns_status_dict
							if gs then
								return { added = gs.added, modified = gs.changed, removed = gs.removed }
							end
						end,
					},
				},
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = sym[vim.diagnostic.severity.ERROR],
							warn = sym[vim.diagnostic.severity.WARN],
							info = sym[vim.diagnostic.severity.INFO],
							hint = sym[vim.diagnostic.severity.HINT],
						},
					},
				},
				lualine_x = {
					{
						function()
							return "recording @" .. vim.fn.reg_recording()
						end,
						cond = function()
							return vim.fn.reg_recording() ~= ""
						end,
					},
					{
						function()
							local names = {}
							for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
								names[#names + 1] = c.name
							end
							return table.concat(names, " ")
						end,
						cond = function()
							return #vim.lsp.get_clients({ bufnr = 0 }) > 0
						end,
					},
					{
						function()
							return "fmt"
						end,
						cond = function()
							return not (vim.g.disable_autoformat or vim.b.disable_autoformat)
						end,
					},
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extensions = { "lazy", "mason", "oil", "trouble", "quickfix" },
		}
	end,
}
