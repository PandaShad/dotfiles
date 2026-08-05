return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        current_line_blame = false,
        on_attach = function(buffer)
            local gs = require("gitsigns")
            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
            end

            -- v2: next_hunk/prev_hunk are deprecated in favour of nav_hunk.
            map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
            map("n", "[h", function() gs.nav_hunk("prev") end, "Prev hunk")

            -- stage_hunk toggles: run it on a staged sign to unstage.
            map({ "n", "v" }, "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", "Stage / unstage hunk")
            map({ "n", "v" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", "Reset hunk")
            map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
            map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
            map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview hunk")
            map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
            map("n", "<leader>ghB", gs.toggle_current_line_blame, "Toggle inline blame")
            map("n", "<leader>ghd", gs.diffthis, "Diff this")
            map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff this ~")
        end,
    },
}
