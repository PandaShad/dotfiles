return {
    { "nvim-mini/mini.nvim", version = false },

    -- File Explorer
	{
		"nvim-mini/mini.files",
        version = false,
		config = function()
			local MiniFiles = require("mini.files")
			MiniFiles.setup({
                content = {
                    -- Predicate for which file system entries to show
                    filter = nil,
                    -- Highlight group to use for a file system entry
                    highlight = nil,
                    -- Prefix text and highlight to show to the left of file system entry
                    prefix = nil,
                    -- Order in which to show file system entries
                    sort = nil,
                },
                -- Module mappings created only inside explorer.
                -- Use `''` (empty string) to not create one.
                mappings = {
                    close       = 'q',
                    go_in       = 'l',
                    go_in_plus  = 'L',
                    go_out      = 'h',
                    go_out_plus = 'H',
                    mark_goto   = "'",
                    mark_set    = 'm',
                    reset       = '<BS>',
                    reveal_cwd  = '@',
                    show_help   = 'g?',
                    synchronize = '=',
                    trim_left   = '<',
                    trim_right  = '>',
                },

                -- General options
                options = {
                    -- Whether to delete permanently or move into module-specific trash
                    permanent_delete = true,
                    -- Whether to use for editing directories
                    use_as_default_explorer = true,
                },

                -- Customization of explorer windows
                windows = {
                    -- Maximum number of windows to show side by side
                    max_number = math.huge,
                    -- Whether to show preview of file/directory under cursor
                    preview = false,
                    -- Width of focused window
                    width_focus = 50,
                    -- Width of non-focused window
                    width_nofocus = 15,
                    -- Width of preview window
                    width_preview = 25,
                },
            })

            -- Keymaps
			vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" }) -- toggle file explorer
			vim.keymap.set("n", "<leader>ef", function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				MiniFiles.reveal_cwd()
			end, { desc = "Toggle into currently opened file" })
		end,
	},
}
