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
          ruff = {
            enabled = true,
            select = { "ALL" },
            ignore = { "S311", "CPY", "E501", "FA", "TD002", "TD003" },
            preview = true,
          },
        },
      },
    },
  })
end

local function gopls_config()
  require("lspconfig").gopls.setup({
    settings = {
      gopls = {
        staticcheck = true,
      },
    },
  })
end


-- Set up LSP

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

require("mason").setup()
require("mason-lspconfig").setup({
  handlers = {
    function(server)
      require("lspconfig")[server].setup({
        capabilities = lsp_capabilities,
      })
    end,
    pylsp = pylsp_config,
    gopls = gopls_config,
  },
})

vim.filetype.add({ extension = { templ = "templ" } })

-- Set up autocompletion

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
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

require("luasnip.loaders.from_snipmate").lazy_load()


-- Set up formatting
require("conform").setup({
  notify_on_error = false,
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
    filter = function(client)
      return client.name ~= "tsserver"
    end,
  },
})
