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
