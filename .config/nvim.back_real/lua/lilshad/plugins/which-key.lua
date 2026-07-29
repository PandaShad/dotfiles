return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        spec = {
            {
                mode = { "n", "x" },
                { "<leader>e", group = "file explorer" },
                { "<leader>f", group = "file/find" },
                { "<leader>g", group = "git" },
                { "<leader>gh", group = "hunks" },
                { "<leader>l", group = "lazygit" },
                { "<leader>s", group = "search" },
                { "<leader>t", group = "tabs/theme" },
            }
        }
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
