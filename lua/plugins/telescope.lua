local actions = require("telescope.actions")
local state = require("telescope.actions.state")
local Path = require("plenary.path")

-- Create new files from the file picker
local create_buffer = function(prompt_bufnr)
  local prompt = state.get_current_line()
  local prompt_path = Path:new(prompt)
  actions.close(prompt_bufnr)
  vim.cmd.edit(prompt_path:absolute())
end

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        -- Center files when opening
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
})

local tb = require("telescope.builtin")

vim.keymap.set("n", "<leader>,", tb.find_files)
vim.keymap.set("n", "<leader>/", tb.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>?", tb.live_grep)
vim.keymap.set("n", "<leader>h", tb.help_tags)
vim.keymap.set("n", "gd", tb.lsp_definitions)
vim.keymap.set("n", "gr", tb.lsp_references)
