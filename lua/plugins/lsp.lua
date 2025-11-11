vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
})

require("mason").setup()

-- Load server configurations

local config_path = vim.fn.stdpath("config")
for cfg in vim.fs.dir(config_path .. "/lua/lsp") do
  local name = cfg:gsub(".lua", "")
  vim.lsp.config(name, require("lsp." .. name))
end


-- Set up autocomplete

require("config.completion")

-- Set up LSP

local ignored_formatters = {
  "vtsls",
  "vue_ls",
  "svelte",
}

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
            return not vim.tbl_contains(ignored_formatters, client.name)
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
