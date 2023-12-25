return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim"
  },
  opts = function()
    local actions = require("telescope.actions")
    require("telescope").load_extension("ui-select")
    return {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown()
        }
      },
      defaults = {
        file_ignore_patterns = { ".git/", "node_modules/" },
        mappings = {
          i = {
					  ["<C-n>"] = actions.move_selection_next,
					  ["<C-p>"] = actions.move_selection_previous,
					  ["<Esc>"] = actions.close,
				  },
				  n = {
					  ["<C-n>"] = actions.move_selection_next,
					  ["<C-p>"] = actions.move_selection_previous,
            ["<Esc>"] = actions.close,
            ["q"] = actions.close,
				  },
        }
      },
    }
  end
}
