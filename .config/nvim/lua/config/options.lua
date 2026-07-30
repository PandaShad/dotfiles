local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Undo and backup
opt.swapfile = false
opt.backup = false
local undodir = vim.fn.stdpath("state") .. "/undodir"
vim.fn.mkdir(undodir, "p")
opt.undodir = undodir
opt.undofile = true

-- Search
opt.incsearch = true
opt.inccommand = "split"
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true
opt.cursorline = true
opt.colorcolumn = "80"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.smoothscroll = true

-- Borders. 0.12 makes these global, so plugins no longer each need a
-- `border = "rounded"` of their own -- floats and the popupmenu just inherit.
opt.winborder = "rounded"
opt.pumborder = "rounded"

-- Folds come from treesitter (see lua/plugins/treesitter.lua). Start fully
-- unfolded -- Neovim's default foldlevel of 0 would collapse every file on open
-- as soon as foldmethod=expr is set.
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Editing behaviour
opt.backspace = { "start", "eol", "indent" }
opt.confirm = true -- prompt instead of failing on :q with unsaved changes

-- Timings
opt.updatetime = 200

-- Misc
opt.isfname:append("@-@")
opt.clipboard:append("unnamedplus")
opt.mouse = "a"
vim.o.statuscolumn = ""