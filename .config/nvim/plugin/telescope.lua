require("telescope").setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
    color_devicons = true,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  }
})

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

nnoremap = map("n")

nnoremap("<C-f>", ":Telescope")

nnoremap("<leader>fs", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<Leader>ff", function()
  require("telescope.builtin").find_files()
end)

nnoremap("<Leader>fo", function()
  require("telescope.builtin").oldfiles()
end)
