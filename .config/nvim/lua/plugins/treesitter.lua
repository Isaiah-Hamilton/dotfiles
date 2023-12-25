return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "bufWinEnter",
  opts = {
    ensure_installed = {
			"c",
      "cpp",
			"lua",
			"vim",
      "vimdoc",
      "fish",
			"html",
			"css",
      "go",
      "rust",
			"javascript",
			"typescript",
			"python",
			"markdown",
			"markdown_inline",
		},
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    autotag = { enable = true },
    autopairs = { enable = true },
    indent = { enable = true }
  }
}
