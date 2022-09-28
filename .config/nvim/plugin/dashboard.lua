local db = require("dashboard")

db.custom_header = {
  "",
  "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
  "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
  "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
  "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
  "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
  "",
  "[ TIP: To exit Neovim, just power off your computer. ]",
  "",
}

db.custom_center = {
  {
    icon = " ",
    desc = "Find File                               ",
    shortcut = "SPC ff",
    action = "Telescope find_files",
  },
  {
    icon = " ",
    desc = "Find History                            ",
    shortcut = "SPC fo",
    action = "Telescope oldfiles",
  },
  {
    icon = " ",
    desc = "File Tree                               ",
    shortcut = "SPC tt",
    action = "NvimTreeFocus",
  }
}

local plugins_count = vim.fn.len(
  vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1)
)

db.custom_footer = {
    "-- Neovim Loaded " .. plugins_count .. " Plugins --",
}
