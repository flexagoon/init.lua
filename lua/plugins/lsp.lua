local lspconfig = require("lspconfig")

local function pylsp_config()
  lspconfig.pylsp.setup({
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
  lspconfig.gopls.setup({
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

require("mason").setup()
require("mason-lspconfig").setup({
  handlers = {
    function(server)
      lspconfig[server].setup({})
    end,
    pylsp = pylsp_config,
    gopls = gopls_config,
  },
})

vim.filetype.add({ extension = { templ = "templ" } })

-- Set up autocomplete

require("care.config").setup({
  selection_behavior = "insert",
  ui = {
    ghost_text = { enabled = false },
  },
})

local care = require("care").api
vim.keymap.set("i", "<C-n>", function()
  if care.is_open() then
    care.select_next()
  else
    care.complete()
  end
end)
vim.keymap.set("i", "<C-p>", care.select_prev)
vim.keymap.set("i", "<C-y>", care.confirm)
vim.keymap.set("i", "<C-c>", care.close)

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
