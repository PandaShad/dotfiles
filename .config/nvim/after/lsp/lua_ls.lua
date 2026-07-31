return {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      codeLens = { enable = true },
      hint = { enable = true, arrayIndex = "Disable" },
      -- stylua via conform owns formatting (phase 6).
      format = { enable = false },
      diagnostics = { globals = { "vim" } },
    },
  },
}
