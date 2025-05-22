require("mason").setup()

-- Server configurations

vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        yapf = { enabled = false },
        autopep8 = { enabled = false },
        pyflakes = { enabled = false },
        mccabe = { enabled = false },

        pylsp_mypy = {
          enabled = true,
          strict = true,
          overrides = {
            "--python-executable", "python",
            "--disable-error-code", "name-defined",
            "--enable-incomplete-feature", "NewGenericSyntax",
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

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      staticcheck = true,
    },
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
    },
  },
})

vim.lsp.config("tailwindcss", {
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

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "vue" },
})

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
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.format({
          async = true,
          filter = function(client)
            return client.name ~= "ts_ls" and client.name ~= "volar"
          end,
        })
      end,
    })
  end,
})

local mason_regisry = require("mason-registry")
for _, pkg in ipairs(mason_regisry.get_installed_packages()) do
  local lspconfig_name = vim.tbl_get(pkg, "spec", "neovim", "lspconfig")
  if lspconfig_name then
    vim.lsp.enable(lspconfig_name)
  end
end

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
