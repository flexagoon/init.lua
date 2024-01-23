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
  }
}
