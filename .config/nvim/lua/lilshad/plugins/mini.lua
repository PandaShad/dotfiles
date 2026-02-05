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

    -- Pairs
    {
        "nvim-mini/mini.pairs",
        version = false,
        config = function ()
            require("mini.pairs").setup({
                -- In which modes mappings from this `config` should be created
                modes = { insert = true, command = false, terminal = false },

                -- Global mappings. Each right hand side should be a pair information, a
                -- table with at least these fields (see more in |MiniPairs.map|):
                -- - <action> - one of 'open', 'close', 'closeopen'.
                -- - <pair> - two character string for pair to be used.
                -- By default pair is not inserted after `\`, quotes are not recognized by
                -- <CR>, `'` does not insert the pair after a letter.
                -- Only parts of tables can be tweaked (others will use these defaults).
                mappings = {
                    ['('] = { action = 'open', pair = '()', neigh_pattern = '^[^\\]' },
                    ['['] = { action = 'open', pair = '[]', neigh_pattern = '^[^\\]' },
                    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '^[^\\]' },

                    [')'] = { action = 'close', pair = '()', neigh_pattern = '^[^\\]' },
                    [']'] = { action = 'close', pair = '[]', neigh_pattern = '^[^\\]' },
                    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '^[^\\]' },

                    ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '^[^\\]',   register = { cr = false } },
                    ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '^[^%a\\]', register = { cr = false } },
                    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '^[^\\]',   register = { cr = false } },
                },
            })
        end
    },

    -- Surround
    {
        "nvim-mini/mini.surround",
        version = false,
        config = function()
            require("mini.surround").setup({
                -- Add custom surroundings to be used on top of builtin ones. For more
                -- information with examples, see `:h MiniSurround.config`.
                custom_surroundings = nil,

               -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
                highlight_duration = 500,

                -- Module mappings. Use `''` (empty string) to disable one.
                mappings = {
                    add = 'sa', -- Add surrounding in Normal and Visual modes
                    delete = 'sd', -- Delete surrounding
                    find = 'sf', -- Find surrounding (to the right)
                    find_left = 'sF', -- Find surrounding (to the left)
                    highlight = 'sh', -- Highlight surrounding
                    replace = 'sr', -- Replace surrounding

                    suffix_last = 'l', -- Suffix to search with "prev" method
                    suffix_next = 'n', -- Suffix to search with "next" method
                },

                -- Number of lines within which surrounding is searched
                n_lines = 20,

                -- Whether to respect selection type:
                -- - Place surroundings on separate lines in linewise mode.
                -- - Place surroundings on each line in blockwise mode.
                respect_selection_type = false,

                -- How to search for surrounding (first inside current line, then inside
                -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
                -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
                -- see `:h MiniSurround.config`.
                search_method = 'cover',

                -- Whether to disable showing non-error feedback
                -- This also affects (purely informational) helper messages shown after
                -- idle time if user input is required.
                silent = false,
            })
        end,
    },
}

