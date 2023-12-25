return {
  "akinsho/bufferline.nvim",
  dependencies = { "echasnovski/mini.bufremove" },
  opts = {
    options = {
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = "nvim_lsp",
      offsets = {
				{
					filetype = "neo-tree",
					text = "File Tree",
					highlight = "Directory",
					separator = true
				}
			}
    }
  }
}
