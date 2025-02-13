return {
  "mellow-theme/mellow.nvim",
  lazy = false, -- make sure we load this during startup
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    vim.cmd([[colorscheme mellow]])
  end,
}
