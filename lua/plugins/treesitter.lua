return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    config = function()
      -- Enable folding
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldlevel = 99

      require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = { "comment" },

        highlight = {
          enable = true
        },
      })
    end
  },

  {
    "IndianBoy42/tree-sitter-just",
    config = true
  }
}
