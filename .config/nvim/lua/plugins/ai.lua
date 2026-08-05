return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		-- Not InsertEnter: sidekick's NES works in normal mode, so the Copilot
		-- LSP needs to be attached from the moment a file opens.
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			suggestion = {
				auto_trigger = true,
			},
			panel = { enabled = false }, -- snacks pickers + sidekick cover this
		},
		config = function(_, opts)
			require("copilot").setup(opts)

			local grp = vim.api.nvim_create_augroup("copilot_blink_ghost", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = grp,
				pattern = "BlinkCmpMenuOpen",
				callback = function()
					vim.b.copilot_suggestion_hidden = true
				end,
			})
			vim.api.nvim_create_autocmd("User", {
				group = grp,
				pattern = "BlinkCmpMenuClose",
				callback = function()
					vim.b.copilot_suggestion_hidden = false
				end,
			})
		end,
	},

	{
		"folke/sidekick.nvim",
		opts = {
			cli = {
				mux = {
					enabled = true,
				},
			},
		},
		keys = {
			{
				"<tab>",
				function()
					return require("sidekick").nes_jump_or_apply() and "" or "<Tab>"
				end,
				expr = true,
				desc = "Goto / apply next edit suggestion",
			},
			{
				"<leader>aa",
				function()
					require("sidekick.cli").toggle()
				end,
				mode = { "n", "v" },
				desc = "Toggle AI CLI",
			},
			{
				"<leader>ac",
				function()
					require("sidekick.cli").toggle({ name = "claude", focus = true })
				end,
				desc = "Claude",
			},
			{
				"<leader>ap",
				function()
					require("sidekick.cli").prompt()
				end,
				mode = { "n", "v" },
				desc = "Prompt picker",
			},
			{
				"<leader>as",
				function()
					require("sidekick.cli").select()
				end,
				desc = "Select CLI",
			},
			{
				"<c-.>",
				function()
					require("sidekick.cli").focus()
				end,
				mode = { "n", "x", "i", "t" },
				desc = "Focus AI CLI",
			},
		},
	},
}
