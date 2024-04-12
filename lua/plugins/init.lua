return {
  -- Automatic indentation
  "tpope/vim-sleuth",

  -- Track my activity with ActivityWatch
  "ActivityWatch/aw-watcher-vim",

  -- Better UI for LSP Actions
  "stevearc/dressing.nvim",

  -- Preview markdown files
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- AI code completions
  "Exafunction/codeium.vim",
}
