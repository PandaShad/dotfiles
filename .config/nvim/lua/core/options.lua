vim.g.netrw_banner = 0

local opt = vim.opt

-- Line Numbers
opt.relativenumber = true
opt.number = true

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

-- Styling
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.cursorline = true

-- backspace
opt.backspace = { "start", "eol", "indent" }

-- Window splits
opt.splitright = true
opt.splitbelow = true

-- Misc
opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"
opt.clipboard:append("unnamedplus")
opt.mouse = "a"
