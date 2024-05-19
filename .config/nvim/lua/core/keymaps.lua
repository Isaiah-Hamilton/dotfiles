-- [[ Set Space as leader key ]]
vim.g.mapleader = " "

-- [[ Remap ESC ]]
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "kk", "<Esc>", { noremap = true, silent = true })

-- [[ Delete char without copy ]]
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- [[ Manage Buffers ]]
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true }) -- Next
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true }) -- Prev

-- [[ Unhighlight search result ]]
vim.keymap.set("n", "<C-m>", ":nohlsearch<cr>", { noremap = true, silent = true })
