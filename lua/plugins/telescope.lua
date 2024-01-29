return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    opts = function()
      local actions = require("telescope.actions")
      local state = require("telescope.actions.state")
      local Path = require("plenary.path")

      local create_buffer = function(prompt_bufnr)
        local prompt = state.get_current_line()
        local prompt_path = Path:new(prompt)
        actions.close(prompt_bufnr)
        vim.cmd.edit(prompt_path:absolute())
      end

      return {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<Tab>"] = actions.select_default,
            },
          },
        },
        pickers = {
          find_files = {
            mappings = {
              i = {
                ["<S-CR>"] = create_buffer,
              },
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
