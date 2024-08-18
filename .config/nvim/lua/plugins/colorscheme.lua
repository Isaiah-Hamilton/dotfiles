return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { transparent_background = true } },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
