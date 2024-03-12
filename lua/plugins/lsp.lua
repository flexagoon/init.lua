local function pylsp_config()
  require("lspconfig").pylsp.setup({
    settings = {
      pylsp = {
        plugins = {
          pylsp_mypy = {
            enabled = true,
            strict = true,
            overrides = {
              "--python-executable", "python",
              "--disable-error-code", "name-defined",
              true,
            }
          },
          black = {
            enabled = true
          }
        }
      }
    }
  })
end

local function setup_lsp_zero()
  local lsp_zero = require("lsp-zero")

  lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
  end)

  require("mason-lspconfig").setup({
    handlers = {
      lsp_zero.default_setup,
      pylsp = pylsp_config,
    }
  })

  vim.filetype.add({ extension = { templ = "templ" } })
end

local function configure_cmp()
  local cmp = require("cmp")
  local cmp_action = require('lsp-zero').cmp_action()

  cmp.setup({
    preselect = "item",
    completion = {
      completeopt = "menu,menuone,noinsert"
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }),
  })
end

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "neovim/nvim-lspconfig",

      -- Completion
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "saadparwaiz1/cmp_luasnip",
        },
        config = configure_cmp
      },

      -- Automatic server installation
      {
        "williamboman/mason.nvim",
        config = true
      },
      "williamboman/mason-lspconfig.nvim",

      -- Enhanced editing of vim configs
      {
        "folke/neodev.nvim",
        config = true
      },

      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end
      },

      -- Autoformat
      {
        'stevearc/conform.nvim',
        opts = {
          notify_on_error = false,
          format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
          },
        },
      },
    },
    config = setup_lsp_zero
  },
  {
    "folke/trouble.nvim",
    config = true,
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh", "TroubleClose" },
    keys = {
      { "<leader>ce", "<cmd>TroubleToggle workspace_diagnostics<CR>" },
    }
  }
}
