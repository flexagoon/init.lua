return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Enable folding
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldlevel = 99

      require("nvim-treesitter.configs").setup({
        auto_install = true,

        highlight = {
          enable = true
        }
      })
    end
  }
}
