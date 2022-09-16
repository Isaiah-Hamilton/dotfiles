local opt = vim.opt

vim.cmd[[set nocompatible]]

opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.termguicolors = true -- Use terminal colors
opt.cursorline = true -- cursor line
opt.colorcolumn = "80" -- That Grey colored column thing
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- Show matching brackets when text indicator is over them
opt.number = true -- Show line numbers
opt.numberwidth = 2 -- width of numberline
opt.ruler = true -- Not sure what this does
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 100 -- Make updates happen ever 100ms
opt.hlsearch = true -- Search for words in current file
opt.scrolloff = 10 -- Make it so there are always 10 lines below my cursor
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.mouse = "a" -- Make it so I can scroll
opt.encoding = "utf-8" -- Encoding
opt.spell = true -- Spell checker
opt.spelllang = "en_us" -- Spell lang

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smart
opt.linebreak = true

opt.belloff = "all" -- Turn off the bell

-- backups
opt.swapfile = false
opt.backup = false
opt.undofile = true
