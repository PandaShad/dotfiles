return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = function(ctx)
			return ctx.plugin and 0 or 250
		end,
		icons = {
			mappings = true,
			colors = true,
		},
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "find" },
				{ "<leader>g", group = "git" },
				{ "<leader>gh", group = "hunk" },
				{ "<leader>x", group = "trouble" },
				{ "<leader>s", group = "search" },
				{ "<leader>t", group = "tab" },
				{ "<leader>u", group = "ui / toggle" },
				{ "<leader>w", group = "window" },
				{ "gs", group = "surround" },
				-- Neovim 0.12 binds grn/gra/grr/gri/grt/grx here (:h lsp-defaults).
				{ "gr", group = "lsp" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer keymaps (which-key)",
		},
	},
}
