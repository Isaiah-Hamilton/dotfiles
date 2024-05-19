return {
  "sainnhe/sonokai",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.sonokai_better_performance = 1
    vim.cmd.colorscheme('sonokai')
  end
}
-- return {
--   "sainnhe/gruvbox-material",
--   lazy = false,
--   priority = 1000,
--   config = function()
-- 		vim.o.background = "dark"
--     vim.g.gruvbox_material_background = ""
--     vim.g.gruvbox_material_better_performance = 1
--     vim.cmd([[colorscheme gruvbox-material]])
--   end
-- }
