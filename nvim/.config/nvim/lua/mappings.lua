local function map(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

nmap = map("n", {noremap = false})
nnoremap = map("n")
vnoremap = map("v")
xnoremap = map("x")
inoremap = map("i")

-- remap Esc
inoremap("jj", "<Esc>")
inoremap("jk", "<Esc>")

-- navigate within insert mode
inoremap("<C-h>", "<Left>")
inoremap("<C-l>", "<Right>")
inoremap("<C-j>", "<Down>")
inoremap("<C-k>", "<Up>")

-- switch between windows
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")

-- save file
nnoremap("<C-s>", "<cmd> w <CR>")

-- undo action
nnoremap("<C-z>", "u")
