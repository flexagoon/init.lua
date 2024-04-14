return {
  -- Automatic indentation
  "Darazaki/indent-o-matic",

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

  -- Required by some plugins to manage their dependencies
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  -- Make HTTP requests from Neovim
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
  },
}
