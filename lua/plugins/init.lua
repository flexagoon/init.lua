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

  -- Navigate the filesystem
  {
    'stevearc/oil.nvim',
    config = true,
    keys = {
      { '<leader>.', '<cmd>Oil --float<cr>' }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
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
        }
      })
    end
  }
}
