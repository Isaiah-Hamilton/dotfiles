require("nvim-tree").setup({
  open_on_setup = true,
  view = {
    adaptive_size = true,
    hide_root_folder = true,
  },
  renderer = {
    icons = {
      show = {
        folder_arrow = false,
      }
    }
  },
  filters = {
    custom = {
      ".DS_Store",
      ".git",
      "node_modules",
    },
  }
})
