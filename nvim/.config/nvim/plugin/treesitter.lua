require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "c_sharp", "cmake", "cpp", "css", "dart", "dockerfile", "elixir", "go", "graphql", "html", "http", "java", "javascript", "json", "lua", "make", "prisma", "python", "regex", "rust", "scss", "sql", "svelte", "swift", "tsx", "typescript", "vue", },
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true
  }
}
