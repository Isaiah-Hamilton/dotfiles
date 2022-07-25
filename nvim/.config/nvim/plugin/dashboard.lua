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
    a = {
        description = { '  New File                       LDR n' },
        command = 'enew',
    },
}

local plugins_count = vim.fn.len(
  vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1)
)

db.custom_footer = {
    '-- Neovim Loaded ' .. plugins_count .. ' Plugins --',
}

