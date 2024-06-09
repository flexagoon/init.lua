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

require("gitsigns").setup({
  on_attach = function()
    local gs = package.loaded.gitsigns

    vim.keymap.set("n", "<leader>gs", gs.stage_hunk)
    vim.keymap.set("n", "<leader>gS", gs.stage_buffer)
    vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk)
    vim.keymap.set("n", "<leader>gh", gs.preview_hunk)
    vim.keymap.set("n", "<leader>gr", gs.reset_hunk)
    vim.keymap.set("v", "<leader>gs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
  end,
})
