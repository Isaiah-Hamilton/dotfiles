return {
  {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'find previously open files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'buffers' })
    vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, { desc = 'spelling suggestions' })
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'colorscheme' })
  end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end,
  },
}
