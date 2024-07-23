-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- [[ Remap ESC ]]
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "kk", "<Esc>", { noremap = true, silent = true })

-- [[ Delete char without copy ]]
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
