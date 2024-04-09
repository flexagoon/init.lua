return {
  {
    "NeogitOrg/neogit",
    branch = "nightly",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      kind = "auto",
      mappings = {
        popup = {
          ["p"] = "PushPopup",
          ["P"] = "PullPopup",
        },
      },
      integrations = {
        telescope = true,
      },
    },
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>" },
      { "<leader>gc", "<cmd>Neogit commit<CR>" },
      { "<leader>gp", "<cmd>Neogit push<CR>" },
      { "<leader>gl", "<cmd>Neogit log<CR>" },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function()
        local gs = package.loaded.gitsigns

        vim.keymap.set("n", "<leader>gs", gs.stage_hunk)
        vim.keymap.set("n", "<leader>gS", gs.stage_buffer)
        vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk)
        vim.keymap.set("n", "<leader>gh", gs.preview_hunk)
        vim.keymap.set("n", "<leader>gr", gs.reset_hunk)
        vim.keymap.set("v", "<leader>gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
      end
    }
  },
}
