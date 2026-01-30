vim.cmd("let g:netrw_banner = 0")

local opt = vim.opt

-- Line numbers
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
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
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
vim.o.statuscolumn = ""
