-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = vim.g.mapleader

-- Doom Emacs-like bindings for saving and exiting
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>")
vim.keymap.set("n", "<leader>qq", "<cmd>q!<CR>")
