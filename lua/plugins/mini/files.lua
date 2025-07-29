require("mini.files").setup({
  mappings = {
    go_in_plus = "<Right>",
    go_out_plus = "<Left>",
  },
})

vim.keymap.set("n", "<leader>.", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end)
