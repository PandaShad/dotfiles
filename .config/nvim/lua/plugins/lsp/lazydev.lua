return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- vim.uv types, only loaded when the buffer mentions vim.uv
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- Register lazydev as a blink source. `opts_extend = { "sources.default" }`
  -- in blink.lua is what makes this append rather than replace the list.
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        default = { "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- rank above the lua_ls results it supersedes
          },
        },
      },
    },
  },
}
