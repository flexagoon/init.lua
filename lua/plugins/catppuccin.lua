require("catppuccin").setup({
  integrations = {
    overseer = true,
    telescope = {
      enabled = true,
      style = "nvchad",
    },
    mason = true,
  },
})

vim.cmd.colorscheme("catppuccin-latte")
