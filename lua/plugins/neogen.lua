--- Generate docstrings
vim.pack.add({ "https://github.com/danymat/neogen" })

local neogen = require("neogen")

neogen.setup({
  snippet_engine = "nvim",
  languages = {
    python = {
      template = { annotation_convention = "numpydoc" },
    },
    typescript = {
      template = { annotation_convention = "tsdoc" },
    },
  },
})

vim.keymap.set("n",
  "<leader>cg",
  neogen.generate,
  { silent = true, noremap = true }
)
