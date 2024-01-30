return {
  "Exafunction/codeium.vim",
  lazy = false,
  config = function()
    vim.keymap.set("i",
      "<C-o>",
      function()
        return vim.fn["codeium#Accept"]()
      end,
      { expr = true, silent = true }
    )
  end,
}
