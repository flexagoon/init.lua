-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = vim.g.mapleader

-- Doom Emacs-like bindings for saving and exiting
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>wq", "ZZ")
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>Q", "ZQ")

-- Switch to alternative buffer
vim.keymap.set("n", "<leader>`", "<cmd>b#<CR>")

-- Delete files
vim.keymap.set("n", "<leader>fd", function()
  vim.fs.rm(vim.api.nvim_buf_get_name(0))
  print("File deleted")
end)

-- Easier window switching
vim.keymap.set("n", ",", "<C-w>")
vim.keymap.set("n", ",s", "<C-w>v")
vim.keymap.set("n", ",S", "<C-w>s")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P')

-- Insert line above text
vim.keymap.set("i", "<S-CR>", "<C-o>O")
