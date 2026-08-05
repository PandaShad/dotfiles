local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer / selection",
		},
		{
			"<leader>uf",
			function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				vim.notify((vim.g.disable_autoformat and "Disabled" or "Enabled") .. " format on save")
			end,
			desc = "Toggle format on save",
		},
	},
	opts = {
		default_format_opts = { lsp_format = "fallback", timeout_ms = 1000 },
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { lsp_format = "fallback", timeout_ms = 500 }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = prettier,
			javascriptreact = prettier,
			typescript = prettier,
			typescriptreact = prettier,
			astro = prettier,
			svelte = prettier,
			css = prettier,
			scss = prettier,
			html = prettier,
			json = prettier,
			jsonc = prettier,
			yaml = prettier,
			markdown = prettier,
		},
	},
}
