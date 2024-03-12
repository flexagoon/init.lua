return {
  "folke/zen-mode.nvim",
  commit = "50e2e2a36cc97847d9ab3b1a3555ba2ef6839b50",
  opts = {
    window = {
      backdrop = 1,
      width = 80,
      height = 0.8,
      options = {
        colorcolumn = "",
        signcolumn = "no",
        number = false,
        relativenumber = false,
      },
    },
    plugins = {
      options = {
        textwidth = 80,
      },
      wezterm = {
        enabled = true,
      },
    },
    on_open = function()
      vim.keymap.set("n", "<leader>r", "gqip")
    end,
    on_close = function()
      vim.keymap.del("n", "<leader>r")
    end,
  },
  cmd = "ZenMode",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>" },
  },
}
