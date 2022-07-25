return require("packer").startup(function()
  -- package manager
  use "wbthomason/packer.nvim"

  -- colorscheme
  use "morhetz/gruvbox"

  -- icons
  use "kyazdani42/nvim-web-devicons"

  -- dashboard
  use "glepnir/dashboard-nvim"

  -- status line
  use {"nvim-lualine/lualine.nvim"}

  -- file tree
  use "kyazdani42/nvim-tree.lua"

  -- other plugins
  use {"akinsho/bufferline.nvim", tag = "v2.*"}
  use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}
  use {"nvim-telescope/telescope.nvim", tag = "0.1.0", requires = {{ "nvim-lua/plenary.nvim" }}}
  use {"nvim-treesitter/nvim-treesitter", run = function() require("nvim-treesitter.install").update({ with_sync = true }) end}
end)
