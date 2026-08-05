return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
		{ "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "[B", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer left" },
		{ "]B", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer right" },
	},
	opts = function()
		local function symbols()
			local signs = (vim.diagnostic.config() or {}).signs
			return type(signs) == "table" and signs.text or {}
		end
		return {
			options = {
				close_command = function(n)
					Snacks.bufdelete(n)
				end,
				right_mouse_command = function(n)
					Snacks.bufdelete(n)
				end,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diag)
					local sym = symbols()
					local parts = {}
					for _, sev in ipairs({ "error", "warning" }) do
						local key = sev == "error" and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN
						if diag[sev] then
							parts[#parts + 1] = (sym[key] or "") .. diag[sev]
						end
					end
					return table.concat(parts, " ")
				end,
				offsets = {
					{
						filetype = "snacks_layout_box",
						text = "Explorer",
						highlight = "Directory",
						text_align = "left",
						separator = true,
					},
				},
				always_show_bufferline = false,
			},
		}
	end,
}
