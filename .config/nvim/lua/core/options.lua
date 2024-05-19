-- [[ Appearance ]]
vim.o.termguicolors = true -- Use terminal colors
vim.o.cmdheight = 0 -- Height of the command line (hide command line unless needed)
vim.o.showmode = false -- Disable showing modes in command line
vim.o.number = true -- Make line numbers default
vim.o.numberwidth = 2 -- Width of numberline
vim.o.cursorline = true -- Highlight the line of the cursor
vim.o.signcolumn = "yes" -- Always show the sign column
vim.o.wrap = false -- Disable line wrapping

-- [[ Files ]]
vim.o.fileencoding = "utf-8" -- File encoding

-- [[ Split Windows ]]
vim.o.splitright = true -- Split right
vim.o.splitbelow = true -- Split below

-- [[ Update and Backups ]]
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 150
vim.o.timeout = true
vim.o.timeoutlen = 300 -- shorten timeout length for which-key
vim.o.undofile = true -- Save undo history

-- [[ Search ]]
vim.o.hlsearch = true -- Highlight search result
vim.o.ignorecase = true -- Ignore case in search
vim.o.smartcase = true -- Smart case in search

-- [[ Clipboard ]]
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim

-- [[ Backspace ]]
vim.o.backspace = "indent,eol,start"

-- [[ Mouse and Scrolling ]]
vim.o.mouse = "a" -- Enable mouse mode

-- [[ Tabs and Indentation ]]
vim.o.tabstop = 2
vim.o.showtabline = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.preserveindent = true

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
