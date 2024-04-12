return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true

    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
