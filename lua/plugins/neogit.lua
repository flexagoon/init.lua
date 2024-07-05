require("neogit").setup({
  kind = "auto",
  mappings = {
    popup = {
      ["p"] = "PushPopup",
      ["P"] = "PullPopup",
    },
  },
  integrations = {
    telescope = true,
  },
})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>Neogit push<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>Neogit log<CR>")
