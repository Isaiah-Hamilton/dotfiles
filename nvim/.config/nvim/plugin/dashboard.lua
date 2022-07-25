local db = require('dashboard')

db.custom_header = {
  '                                 ',
  '███╗   ██╗██╗   ██╗██╗███╗   ███╗',
  '████╗  ██║██║   ██║██║████╗ ████║',
  '██╔██╗ ██║██║   ██║██║██╔████╔██║',
  '██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  '██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
  '╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
  '                                 ',
}

db.custom_center = {
  {
    icon = ' ',
    desc = 'New File                                 ',
    shortcut = 'space n',
    action = 'enew',
  },
  {
    icon = ' ',
    desc = 'Find File                               ',
    shortcut = 'space ff',
    action = 'Telescope find_files',
  },
  {
    icon = ' ',
    desc = 'Find History                            ',
    shortcut = 'space fo',
    action = 'Telescope oldfiles',
  }
}

local plugins_count = vim.fn.len(
  vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1)
)

db.custom_footer = {
    '-- Neovim Loaded ' .. plugins_count .. ' Plugins --',
}

