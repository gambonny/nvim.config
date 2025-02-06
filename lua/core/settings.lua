vim.g.mapleader = ";"
local opt = vim.opt

-- Session Management
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.laststatus = 3
opt.cmdheight = 0

-- Backspace
opt.backspace = "indent,eol,start"

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - and _ as part of keywords
opt.iskeyword:append("-")
opt.iskeyword:append("_")

-- Disable the mouse
opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- Behavior
opt.list = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.autoread = true

-- Performance Tweaks
opt.timeoutlen = 500
opt.updatetime = 250
opt.ttyfast = true

-- Undo History
opt.undofile = true
opt.undodir = vim.fn.stdpath("cache") .. "/undo"

-- Highlight Yanked Text
vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout = 200 }
  augroup END
]])
