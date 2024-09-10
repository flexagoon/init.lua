require("neogen").setup({
  snippet_engine = "nvim",
  languages = {
    python = {
      template = {
        annotation_convention = "numpydoc",
      },
    },
  },
})
