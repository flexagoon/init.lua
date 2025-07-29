local function window_config()
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = "NW",
    width = width,
    row = 5,
    col = math.floor(0.5 * (vim.o.columns - width)),
    border = "solid",
  }
end

require("mini.pick").setup({
  options = { content_from_bottom = true },
  window = { config = window_config },
})

vim.ui.select = MiniPick.ui_select

vim.keymap.set("n", "<leader>,", MiniPick.builtin.files)
vim.keymap.set("n", "<leader>?", MiniPick.builtin.grep_live)
vim.keymap.set("n", "<leader>h", MiniPick.builtin.help)
