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
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- indenting
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- scrolling
vim.opt.mouse = 'a'

-- appearance
vim.opt.laststatus = 2
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.colorcolumn = "80"
