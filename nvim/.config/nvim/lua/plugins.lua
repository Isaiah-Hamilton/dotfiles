return require("packer").startup(function()
  -- package manager
  use "wbthomason/packer.nvim"

  -- colorscheme
  use "morhetz/gruvbox"

  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}
end)
