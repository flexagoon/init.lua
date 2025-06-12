require("overseer").setup({
  templates = { "builtin", "user.esp_idf" },
  task_list = { min_height = 15 },
})

vim.keymap.set("n", "<leader>tr", "<cmd>OverseerRun<CR>")
vim.keymap.set("n", "<leader>tl", "<cmd>OverseerToggle<CR>")
vim.keymap.set("n", "<leader>ta", "<cmd>OverseerQuickAction<CR>")
vim.keymap.set("n", "<leader>tk", "<cmd>OverseerQuickAction dispose<CR>")
