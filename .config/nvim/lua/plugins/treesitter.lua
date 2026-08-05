local parsers = {
	-- core / config
	"bash",
	"c",
	"diff",
	"lua",
	"luadoc",
	"luap",
	"printf",
	"query",
	"regex",
	"vim",
	"vimdoc",
	-- web
	"astro",
	"css",
	"scss",
	"html",
	"javascript",
	"jsdoc",
	"svelte",
	"tsx",
	"typescript",
	-- go
	"go",
	"gomod",
	"gosum",
	"gowork",
	-- data / docs
	"json",
	"json5",
	"markdown",
	"markdown_inline",
	"toml",
	"xml",
	"yaml",
	-- tooling
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitcommit",
	"gitignore",
	"graphql",
	"sql",
}

local native_indent = {
	astro = true,
	css = true,
	html = true,
	javascript = true,
	javascriptreact = true,
	scss = true,
	svelte = true,
	typescript = true,
	typescriptreact = true,
	vue = true,
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			ts.setup()

			-- Install only what's missing
			local installed = require("nvim-treesitter.config").get_installed("parsers")
			local missing = vim.tbl_filter(function(lang)
				return not vim.tbl_contains(installed, lang)
			end, parsers)
			if #missing > 0 then
				ts.install(missing)
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter_enable", { clear = true }),
				desc = "Enable treesitter highlighting, folds and indent",
				callback = function(ev)
					local lang = vim.treesitter.language.get_lang(ev.match)
					-- No parser (yet) for this filetype: leave the buffer on regex syntax.
					if not lang or not pcall(vim.treesitter.start, ev.buf, lang) then
						return
					end

					vim.wo[0][0].foldmethod = "expr"
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"

					if not native_indent[ev.match] then
						vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
	},
}
