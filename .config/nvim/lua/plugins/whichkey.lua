return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").register({
      -- [[ Basic Operations ]]
      q = { ":q<cr>", "Quit File", noremap = true, silent = true },
			Q = { ":q!<cr>", "Force Quit File", noremap = true, silent = true },
			w = { ":w<cr>", "Save File", noremap = true, silent = true },
			W = { ":w!<cr>", "Force Save File", noremap = true, silent = true },
      n = { ":enew<cr>", "New File", noremap = true, silent = true },

      -- [[ Neo Tree ]]
      t = {
        name = "Neo Tree",
        t = { ":Neotree toggle<cr>", "Neo Tree Toggle", noremap = true, silent = true },
        f = { ":Neotree focus<cr>", "Neo Tree Focus", noremap = true, silent = true }
      },

      -- [[ Telescope ]]
      f = {
        name = "Telescope",
        f = { ":Telescope find_files<cr>", "Find Files", noremap = true, silent = true },
        o = { ":Telescope oldfiles<cr>", "Find Old Files", noremap = true, silent = true },
        w = { ":Telescope live_grep<cr>", "Find Word", noremap = true, silent = true }
      },

      -- [[ Split Window ]]
      s = {
        name = "Split",
        v = { ":vsplit<cr>", "Split Vertically", noremap = true, silent = true },
        h = { ":split<cr>", "Split Horizontal", noremap = true, silent = true }
      }
    }, { prefix = "<leader>" })
  end
}
