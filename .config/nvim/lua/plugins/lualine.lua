return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "sonokai",
      component_separators = "|",
      section_separators = "",
      disabled_filetypes = {
        statusline = {
          "neo-tree",
          "dashboard",
          "alpha",
          "starter"
        }
      }
    }
  }
}
