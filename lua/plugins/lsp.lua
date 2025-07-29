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

vim.lsp.config("clangd", {
  cmd = {
    vim.fs.find("clangd", { path = vim.env.IDF_TOOLS_PATH })[1],
    "--compile-commands-dir=build",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--fallback-style=llvm",
  },
  root_markers = { "sdkconfig", ".git" },
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

    vim.api.nvim_clear_autocmds({ group = lsp_formatting_group, buffer = ev.buf })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "LspFormatting",
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.format({
          async = true,
          filter = function(client)
            return client.name ~= "ts_ls" and client.name ~= "vue_ls"
          end,
        })
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.iter(require("mason-registry").get_installed_packages())
        :map(function(pkg) return vim.tbl_get(pkg, "spec", "neovim", "lspconfig") end)
        :each(vim.lsp.enable)
  end,
})

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
