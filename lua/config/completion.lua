vim.o.completeopt = "menuone,noinsert,popup,fuzzy"
vim.o.complete = "o"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method("textDocument/completion") then
      local trigger_chars = client.server_capabilities.completionProvider.triggerCharacters or {}
      for i = 32, 255 do
        local char = string.char(i)
        if vim.fn.match(char, "[[:keyword:]]") >= 0 then
          table.insert(trigger_chars, char)
        end
      end
      client.server_capabilities.completionProvider.triggerCharacters = trigger_chars

      vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
        autotrigger = true,
        convert = function(item)
          local kind = vim.lsp.protocol.CompletionItemKind[item.kind] or ""
          return {
            menu = "",
            kind_hlgroup = "CmpItemKind" .. kind,
          }
        end,
      })
    end
  end,
})

vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-e><CR>"
  end
  return "<CR>"
end, { expr = true })
