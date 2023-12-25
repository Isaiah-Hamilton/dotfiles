return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim"
  },
  opts = {
    close_if_last_window = true,
    auto_clean_after_session_restore = true,
    window = {
      width = 30
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          "node_modules/",
        },
        never_show = {
          ".DS_Store",
          ".turbo",
          ".git"
        },
      }
    }
  }
}
