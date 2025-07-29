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
