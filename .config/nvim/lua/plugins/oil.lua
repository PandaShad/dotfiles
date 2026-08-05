return {
	"stevearc/oil.nvim",
	---@module 'oil'
	------@type oil.SetupOpts
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<C-h>"] = false,
			["<C-c>"] = false, -- prevent from closing Oil as <C-c> is esc key
			["<M-h>"] = "actions.select_split",
			["q"] = "actions.close",
		},
		float = {
			padding = 2,
			max_width = 90,
			max_height = 30,
			border = "rounded",
			win_options = { winblend = 0 },
		},
	},
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
		{
			"<leader>-",
			function()
				require("oil").toggle_float()
			end,
			desc = "Oil (float)",
		},
	},
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
