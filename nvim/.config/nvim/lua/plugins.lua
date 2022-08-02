local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer. nvin"

-- install packer if not already installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute ("!git clone https://github.com/wbthomason/packer.nvim" .. install_path)
end

return require("packer").startup(function()
  -- package manager
  use "wbthomason/packer.nvim"

  -- colorscheme
  use "Isaiah-Hamilton/gruvbox-material"
  -- use "ful1e5/onedark.nvim"
  -- use "ellisonleao/gruvbox.nvim"

  use "kyazdani42/nvim-web-devicons" -- icons
  use "glepnir/dashboard-nvim" -- dashboard
  use "nvim-lualine/lualine.nvim" -- status line
  use "kyazdani42/nvim-tree.lua" -- file tre
  use {"akinsho/bufferline.nvim", tag = "v2.*"} -- tabs
  use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end} -- auto close brackets
  use {"nvim-telescope/telescope.nvim", tag = "0.1.0", requires = {{ "nvim-lua/plenary.nvim" }}} -- fuzzy finder
  use {"nvim-treesitter/nvim-treesitter", run = function() require("nvim-treesitter.install").update({ with_sync = true }) end} -- syntax highlighter
end)
