-- Remap ESC
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'kk', '<Esc>', { noremap = true, silent = true })

-- Delete char without copy
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true }) -- Move left
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true }) -- Move down
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true }) -- Move up
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true }) -- Move right

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { noremap = true, silent = true })    -- Increase height
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { noremap = true, silent = true })  -- Decrease height
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })  -- Decrease width
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true }) -- Increase width

-- Create window
vim.keymap.set('n', '<leader>-', ':split<CR>', { noremap = true, silent = true })   -- Horizontal split
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { noremap = true, silent = true }) -- Vertical split
