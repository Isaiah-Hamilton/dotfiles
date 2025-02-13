return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      {
        'Kaiser-Yang/blink-cmp-git',
        dependencies = { 'nvim-lua/plenary.nvim' }
      },
    },
    event = "InsertEnter",
    version = '*',
    opts = {
      keymap = { preset = 'default' },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = {
          border = "rounded",
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
          },
        },
        ghost_text = {
          enable = vim.g.ai_cmp,
        },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'normal',
      },
      signature = { enabled = true },
      sources = {
        default = { "git", "lsp", "path", "snippets", "buffer" },
        providers = {
          git = {
            module = 'blink-cmp-git',
            name = 'Git',
            enabled = true,
            opts = {},
          },
        },
      },
    },
  },
}
