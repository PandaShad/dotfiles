return {
	-- Kanagawa
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = true,
		opts = {
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors)
				return {}
			end,
			theme = "wave",
			background = { dark = "wave", light = "lotus" },
		},
	},

	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		opts = {
			flavour = "mocha",
			background = { light = "latte", dark = "mocha" },
			integrations = {
				blink_cmp = true,
				gitsigns = true,
				mini = { enabled = true },
				native_lsp = { enabled = true, underlines = { errors = { "undercurl" } } },
				treesitter = true,
				which_key = true,
			},
		},
	},

	-- Rose pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		opts = {
			variant = "auto", -- auto, main, moon, or dawn
			dark_variant = "main",
		},
	},

	-- Everforest
	{
		"sainnhe/everforest",
		lazy = true,
		init = function()
			vim.g.everforest_background = "medium" -- hard, medium, soft
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_better_performance = 1
		end,
	},

	-- Nord
	{
		"shaunsingh/nord.nvim",
		lazy = true,
		init = function()
			vim.g.nord_borders = true
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_contrast = true
			vim.g.nord_disable_background = false
		end,
	},

	-- Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- Monochrome
	{
		"kdheepak/monochrome.nvim",
		lazy = true,
	},
}
