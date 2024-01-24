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
        { "<leader>,", tb.find_files },
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
  }
}
