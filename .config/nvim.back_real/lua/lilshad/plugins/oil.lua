return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    -- opts = {},
    -- Optional dependencies
    -- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
            -- "permissions",
            -- "size",
            -- "mtime",
            },
            keymaps = {
				["<C-h>"] = false,
                ["<C-c>"] = false, -- prevent from closing Oil as <C-c> is esc key
				["<M-h>"] = "actions.select_split",
                ["q"] = "actions.close",
			},
            delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
            skip_confirm_for_simple_edits = true,
        })

        -- Keymaps
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end,
}
