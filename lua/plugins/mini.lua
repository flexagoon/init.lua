require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

require("mini.surround").setup()

require("mini.ai").setup({
  custom_textobjects = {
    f = require("mini.ai").gen_spec.treesitter({
      a = "@function.outer",
      i = "@function.inner",
    }),
  },
})

require("mini.files").setup({
  mappings = {
    go_in_plus = "<Right>",
    go_out_plus = "<Left>",
  },
})
vim.keymap.set("n", "<leader>.", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end)

require("mini.diff").setup({
  mappings = {
    apply = "<leader>gs",
    reset = "<leader>gr",
  },
})
vim.keymap.set("n", "<leader>gh", MiniDiff.toggle_overlay)
vim.keymap.set("n", "<leader>gs", function()
  return MiniDiff.operator("apply") .. "gh"
end, { expr = true, remap = true })
vim.keymap.set("n", "<leader>gr", function()
  return MiniDiff.operator("reset") .. "gh"
end, { expr = true, remap = true })
