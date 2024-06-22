require("overseer").setup()

vim.keymap.set("n", "<leader>tr", "<cmd>OverseerRun<CR>")
vim.keymap.set("n", "<leader>tl", "<cmd>OverseerToggle<CR>")
