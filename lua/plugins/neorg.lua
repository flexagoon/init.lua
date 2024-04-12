return {
  "nvim-neorg/neorg",
  dependencies = { "vhyrro/luarocks.nvim" },
  ft = "norg",
  cmd = "Neorg",
  config = function()
    vim.opt.conceallevel = 2

    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
      },
    })
  end,
}
