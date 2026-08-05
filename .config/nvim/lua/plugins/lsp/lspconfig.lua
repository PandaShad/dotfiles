local servers = {
	"lua_ls",
	"vtsls",
	"gopls",
	"astro",
	"tailwindcss",
	"eslint",
	"html",
	"cssls",
	"jsonls",
	"yamlls",
	"emmet_language_server",
}

local virtual_text = {
	spacing = 2,
	source = "if_many",
}

return {
	"neovim/nvim-lspconfig",
	dependencies = { "mason-org/mason.nvim", "saghen/blink.cmp" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(nil, true),
		})

		vim.lsp.enable(servers)

		vim.diagnostic.config({
			virtual_text = virtual_text,
			virtual_lines = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = { source = "if_many" }, -- border inherits winborder
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󱐋 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		-- Swap compact end-of-line text for full wrapped lines on the current line
		-- for reading long TypeScript errors without leaving the buffer.
		vim.keymap.set("n", "<leader>ud", function()
			local showing_lines = vim.diagnostic.config().virtual_lines ~= false
			vim.diagnostic.config({
				virtual_lines = not showing_lines and { current_line = true } or false,
				virtual_text = showing_lines and virtual_text or false,
			})
		end, { desc = "Toggle diagnostic virtual lines" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
			desc = "LSP keymaps and per-client features",
			callback = function(ev)
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
				end

				-- 0.12 already binds grn/gra/grr/gri/grt/grx/gO/K -- see :h
				-- -- lsp-defaults. Only add what's genuinely missing.
				map("gd", vim.lsp.buf.definition, "Goto definition")
				map("gD", vim.lsp.buf.declaration, "Goto declaration")

				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client and client:supports_method("textDocument/inlayHint") then
					-- Off by default
					map("<leader>uh", function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }),
							{ bufnr = ev.buf }
						)
					end, "Toggle inlay hints")
				end
			end,
		})
	end,
}
