return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      }
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
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
              ["<Tab>"] = actions.select_default + actions.center,
              ["<CR>"] = actions.select_default + actions.center,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            file_ignore_patterns = { ".git/" },
            mappings = {
              i = {
                ["<S-CR>"] = create_buffer,
              },
            },
          },
        },
        extensions = {
          file_browser = {
            mappings = {
              i = {
                ["<Tab>"] = actions.select_default,
                ["<CR>"] = actions.select_default,
                ["<C-n>"] = actions.toggle_selection,
              },
            }
          }
        }
      }
    end,
    keys = function()
      local tb = require("telescope.builtin")
      return {
        { "<leader>,", tb.find_files },
        { "<leader>/", tb.current_buffer_fuzzy_find },
        { "<leader>?", tb.live_grep },
        { "<leader>h", tb.help_tags },
      }
    end,
    cmd = "Telescope"
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
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
      { "<leader>.", "<cmd>Telescope file_browser path=%:p:h<CR>" }
    }
  }
}
