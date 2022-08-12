vim.cmd[[set nocompatible]]

-- number line
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = true

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- encoding
vim.opt.encoding = "utf-8"

-- spell checker
-- vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- indenting
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false

-- backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- scrolling
vim.opt.mouse = "a"
vim.opt.scrolloff = 8

-- appearance
vim.opt.termguicolors = true
vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.colorcolumn = "80"

-- updatetime (ms)
vim.opt.updatetime = 100
