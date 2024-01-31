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
vim.keymap.set("n", "<leader>fd", "<cmd>!rm %<CR>")

-- Easier window switching
vim.keymap.set("n", ",", "<C-w>")
vim.keymap.set("n", ",s", "<C-w>v")
vim.keymap.set("n", ",S", "<C-w>s")
