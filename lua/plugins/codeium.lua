return {
  "Exafunction/codeium.vim",
  lazy = false,
  config = function()
    vim.g.codeium_disable_bindings = 1

    vim.keymap.set("i",
      "<C-o>",
      function()
        return vim.fn["codeium#Accept"]()
      end,
      { expr = true, silent = true }
    )

    -- Keep built-in C-o functionality
    vim.keymap.set("i", "<C-e>", "<C-o>", { noremap = true })
  end,
}
