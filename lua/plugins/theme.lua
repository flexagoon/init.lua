return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = true,
      dimInactive = true,
    })
    vim.cmd.colorscheme("kanagawa")
  end,
}
