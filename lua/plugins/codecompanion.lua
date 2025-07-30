vim.pack.add({
  "https://github.com/olimorris/codecompanion.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
})

require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "gemini",
      keymaps = {
        completion = {
          modes = {
            i = "<C-n>",
          },
        },
      },
    },
    inline = {
      adapter = "gemini",
    },
  },
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "cmd:rbw get Google -f \"Gemini API\"",
        },
      })
    end,
  },
})

vim.keymap.set("n", "<leader>a", "<cmd>CodeCompanionChat Toggle<CR>")
