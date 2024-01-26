return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
      }
    end,
    keys = function()
      local tb = require("telescope.builtin")
      return {
        {
          "<leader>,",
          function()
            tb.find_files({
              hidden = true,
              file_ignore_patterns = { ".git/" }
            })
          end
        },
      }
    end
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    main = "project_nvim",
    config = true,
    keys = {
      { "<leader>p", "<cmd>Telescope projects<CR>" }
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },
    keys = {
      { "<leader>.", "<cmd>Telescope file_browser<CR>" }
    }
  }
}
