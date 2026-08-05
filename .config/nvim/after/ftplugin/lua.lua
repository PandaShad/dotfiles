-- stylua (see .stylua.toml) formats Lua with tabs, but 'expandtab' is on
-- globally in config.options -- so without this, typing inserts spaces that
-- stylua rewrites to tabs on every save.
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
