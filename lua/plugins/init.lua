vim.pack.add({
  -- Generate docstrings
  "https://github.com/danymat/neogen",

  -- Various utility mini-plugins
  "https://github.com/echasnovski/mini.nvim",

  -- The best git UI
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/nvim-lua/plenary.nvim", -- Dependency

  -- Language server management
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",

  -- Treesitter management
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },

  -- Automatic indentation
  "https://github.com/NMAC427/guess-indent.nvim",

  -- Best task runner
  "https://github.com/stevearc/overseer.nvim",

  -- Track my activity with ActivityWatch
  "https://github.com/ActivityWatch/aw-watcher-vim",

  -- Buzzword salad (AI)
  "https://github.com/monkoose/neocodeium",
  "https://github.com/olimorris/codecompanion.nvim",

  -- Colorscheme
  {
    src = "https://github.com/catppuccin/nvim",
    name = "catppuccin",
  },
})

-- Load all plugin configs
local config_path = vim.fn.stdpath("config")
for cfg in vim.fs.dir(config_path .. "/lua/plugins") do
  if cfg ~= "init.lua" then
    local name = cfg:gsub(".lua", "")
    require("plugins." .. name)
  end
end
