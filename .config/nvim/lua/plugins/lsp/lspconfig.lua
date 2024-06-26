return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.keymap.set("n", "gd", vim. lsp.buf.definition, {})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    -- lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities
    })

    -- javascript/typescript
    lspconfig.tsserver.setup({
      capabilities = capabilities
    })

    -- rust
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities
    })

    -- go
    lspconfig.gopls.setup({
      capabilities = capabilities
    })
  end
}
