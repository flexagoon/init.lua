return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
  keys = function()
    local harpoon = require("harpoon")

    return {
      { "<leader>a", function() harpoon:list():append() end },
      { "<leader>o", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },

      { "<C-n>",     function() harpoon:list():select(1) end },
      { "<C-e>",     function() harpoon:list():select(2) end },
      { "<C-i>",     function() harpoon:list():select(3) end },
      { "<C-o>",     function() harpoon:list():select(4) end },
    }
  end
}
