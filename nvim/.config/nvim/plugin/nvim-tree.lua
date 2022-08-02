require("nvim-tree").setup({
  view = {
    width = 30,
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
