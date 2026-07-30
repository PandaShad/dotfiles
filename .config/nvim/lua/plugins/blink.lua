return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "nvim-mini/mini.icons",
    },
    -- Release tag, so the prebuilt fuzzy-matcher binary is downloaded.
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- C-y accept, C-n/C-p select, C-space menu/docs, C-e hide, C-k signature.
        keymap = { preset = "default" },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
            ghost_text = { enabled = true },
        },

        signature = { enabled = true },

        cmdline = {
            -- Default only auto-shows the menu in the cmdline window (q:).
            completion = { menu = { auto_show = true } },
            -- Default applies { 'buffer', 'cmdline' } to every cmdline type, which
            -- offers buffer words while typing `:` commands. Split them by type.
            sources = function()
                local t = vim.fn.getcmdtype()
                if t == "/" or t == "?" then
                    return { "buffer" }
                end
                if t == ":" or t == "@" then
                    return { "cmdline" }
                end
                return {}
            end,
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },

    config = function(_, opts)
        local MiniIcons = require("mini.icons")
        local kind_icons = {}
        for _, kind in ipairs(vim.lsp.protocol.CompletionItemKind) do
            if type(kind) == "string" then
                kind_icons[kind] = MiniIcons.get("lsp", kind:lower())
            end
        end
        opts.appearance.kind_icons = kind_icons

        require("blink.cmp").setup(opts)
    end,
}
