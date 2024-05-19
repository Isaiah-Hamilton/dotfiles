return {
  {
    "williamboman/mason.nvim",
    opts = {} -- This triggers the setup() function
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls", -- lua
        "rust_analyzer", -- rust
        "clangd", -- c/c++
        "tailwindcss-language-server" -- tailwind
      },
      automatic_installation = true
    }
  }
}
