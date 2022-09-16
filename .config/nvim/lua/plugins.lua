local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer is not installed")
  return
end

return require("packer").startup(function()
  -- package manager
  use "wbthomason/packer.nvim"

  -- colorscheme
  -- use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  -- use "Isaiah-Hamilton/gruvbox-material"
  -- use "arcticicestudio/nord-vim"

  -- completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-cmdline"
  use "onsails/lspkind.nvim"

  use "windwp/nvim-ts-autotag"
  use "kyazdani42/nvim-web-devicons" -- icons
  use "glepnir/dashboard-nvim" -- dashboard
  use "nvim-lualine/lualine.nvim" -- status line
  use "kyazdani42/nvim-tree.lua" -- file tree
  use {"akinsho/bufferline.nvim", tag = "v2.*"} -- tabs
  use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end} -- auto close brackets
  use {"nvim-telescope/telescope.nvim", tag = "0.1.0", requires = {{ "nvim-lua/plenary.nvim" }}} -- fuzzy finder
  use {"nvim-treesitter/nvim-treesitter", run = function() require("nvim-treesitter.install").update({ with_sync = true }) end} -- syntax highlighter
end)
