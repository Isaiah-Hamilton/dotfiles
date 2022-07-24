return require("packer").startup(function()
  -- package manager
  use "wbthomason/packer.nvim"

  -- colorscheme
  use "morhetz/gruvbox"

  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end}
end)
