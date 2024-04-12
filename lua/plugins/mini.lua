return {
  "echasnovski/mini.nvim",
  version = false,

  config = function()
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
  end,
}
