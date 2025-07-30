--- The best git UI
vim.pack.add({
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/nvim-lua/plenary.nvim",
})

require("neogit").setup({
  kind = "auto",
  mappings = {
    popup = {
      ["p"] = "PushPopup",
      ["P"] = "PullPopup",
    },
  },
  integrations = {
    mini_pick = true,
  },
})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>Neogit push<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>Neogit log<CR>")
