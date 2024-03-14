return {
  -- Automatic indentation
  "tpope/vim-sleuth",

  -- Quickly comment lines
  {
    "numToStr/Comment.nvim",
    config = true,
  },

  -- Track my activity with ActivityWatch
  "ActivityWatch/aw-watcher-vim",

  "stevearc/dressing.nvim",

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- AI code completions
  "Exafunction/codeium.vim",

  {
    'stevearc/oil.nvim',
    config = true,
    keys = {
      { '<leader>.', '<cmd>Oil --float<cr>' }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
