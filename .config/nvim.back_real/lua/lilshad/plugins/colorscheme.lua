return {
    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- priority = 1000
        config = function()
            require("catppuccin").setup({
                flavour = "mocha"
            })
            -- vim.cmd("colorscheme catppuccin")
        end
    },
    -- Rose pine
    {
        "rose-pine/neovim",
	    name = "rose-pine",
	    config = function()
            require("rose-pine").setup({
                variant = "auto", -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
            })
            -- vim.cmd("colorscheme rose-pine")
	    end
    },
    -- Everforest
    {
        'sainnhe/everforest',
        lazy = false,
        -- priority = 1000,
        config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.everforest_background = "medium" -- hard, medium or soft
        vim.g.everforest_enable_italic = true
        -- vim.cmd.colorscheme('everforest')
      end
    },
    -- Kanagawa
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        config = function()
            require("kanagawa").setup({
                compile = false,             -- enable compiling the colorscheme
                undercurl = true,            -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true},
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,         -- do not set background color
                dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
                terminalColors = true,       -- define vim.g.terminal_color_{0,17}
                colors = {                   -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "wave",              -- Load "wave", "dragon" or "lotus" theme
                background = {               -- map the value of 'background' option to a theme
                    dark = "wave",           -- try "dragon", "wave" or "lotus" !
                    light = "lotus"
                },
            })
            vim.cmd("colorscheme kanagawa")
        end
    }
}
