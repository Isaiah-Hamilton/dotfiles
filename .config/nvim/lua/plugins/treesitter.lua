return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "go", "rust",
        "typescript", "javascript", "swift", "json", "html", "markdown"
      },
      auto_install = true, -- Automatically install missing parsers
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
