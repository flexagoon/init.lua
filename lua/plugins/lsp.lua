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

local function luals_config()
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        completion = { callSnippet = "Replace" },
      },
    },
  })
end

local function tailwidcss_config()
  lspconfig.tailwindcss.setup({
    settings = {
      tailwindCSS = {
        includeLanguages = {
          templ = "html",
          heex = "html-eex",
          eelixir = "html-eex",
        },
      },
    },
  })
end

local function markdown_oxide_config()
  lspconfig.markdown_oxide.setup({
    capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      }
    ),
  })
end

-- Set up autocomplete

require("config.completion")

-- Set up LSP

local lsp_formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

    vim.api.nvim_clear_autocmds({ group = lsp_formatting_group, buffer = ev.buf })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "LspFormatting",
      callback = function()
        vim.lsp.buf.format({
          async = true,
          filter = function(client)
            return client.name ~= "ts_ls"
          end,
        })
      end,
    })
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
    lua_ls = luals_config,
    tailwindcss = tailwidcss_config,
    markdown_oxide = markdown_oxide_config,
  },
})

vim.filetype.add({
  extension = {
    templ = "templ",
    mdx = "mdx",
  },
})
