return {
    -- Pairs
    {
        "nvim-mini/mini.pairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Surround. Moved off the default `s*` mappings so flash.nvim can own `s`.
    {
        "nvim-mini/mini.surround",
        event = "VeryLazy",
        opts = {
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsr",
                suffix_last = "l",
                suffix_next = "n",
            },
            n_lines = 50,
            search_method = "cover_or_next",
        },
    },

    -- Better a/i text objects.
    {
        "nvim-mini/mini.ai",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        opts = function()
            local ai = require("mini.ai")
            return {
                n_lines = 500,
                custom_textobjects = {
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
                    o = ai.gen_spec.treesitter({
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    u = ai.gen_spec.function_call(),
                    d = { "%f[%d]%d+" },
                },
            }
        end,
    },
}
