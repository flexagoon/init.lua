return {
  "nvim-neorg/neorg",
  dependencies = { {
    "vhyrro/luarocks.nvim",
    config = true,
  } },
  ft = "norg",
  cmd = "Neorg",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
    },
  },
}
