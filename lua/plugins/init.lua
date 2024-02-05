return {
  -- Automatic indentation
  "tpope/vim-sleuth",

  -- Quickly comment lines
  {
    "numToStr/Comment.nvim",
    config = true,
    keys = { "gcc", "gbc", "gc", "gb", "gcO", "gco", "gcA" },
  },

  -- Track my activity with ActivityWatch
  "ActivityWatch/aw-watcher-vim",

  "stevearc/dressing.nvim",

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
