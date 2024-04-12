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
            },
          },
          black = {
            enabled = true,
          },
        },
      },
    },
  })
end

local function setup_lsp()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
      local opts = { buffer = ev.buf }

      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
    end,
  })

  local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

  require("mason-lspconfig").setup({
    handlers = {
      function(server)
        require("lspconfig")[server].setup({
          capabilities = lsp_capabilities,
        })
      end,
      pylsp = pylsp_config,
    },
  })

  vim.filetype.add({ extension = { templ = "templ" } })
end

local function setup_cmp()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  cmp.setup({
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "emoji" },
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<C-f>"] = cmp.mapping(function()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { "i", "s" }),
      ["<C-b>"] = cmp.mapping(function()
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { "i", "s" }),
    }),
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatic server installation
      {
        "williamboman/mason.nvim",
        config = true,
      },
      "williamboman/mason-lspconfig.nvim",

      -- Enhanced editing of vim configs
      {
        "folke/neodev.nvim",
        config = true,
        ft = "lua",
      },
    },
    config = setup_lsp,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",

      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end,
      },
      "saadparwaiz1/cmp_luasnip",

      -- Emojis
      "hrsh7th/cmp-emoji",
    },
    config = setup_cmp,
  },

  -- Autoformat
  {
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  -- Diagnostics
  {
    "folke/trouble.nvim",
    config = true,
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh", "TroubleClose" },
    keys = {
      { "<leader>ce", "<cmd>TroubleToggle workspace_diagnostics<CR>" },
    },
  },
}
