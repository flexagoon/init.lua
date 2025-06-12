vim.o.completeopt = "menuone,noinsert,popup,fuzzy"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
      autotrigger = false,
      convert = function(item)
        local kind = vim.lsp.protocol.CompletionItemKind[item.kind] or ""
        return {
          menu = "",
          kind_hlgroup = "CmpItemKind" .. kind,
        }
      end,
    })
  end,
})

local COMPLETION_DELAY_MS = 25

local completion_timer = vim.uv.new_timer()

local function should_trigger_completion(char)
  local is_keyword = vim.fn.match(char, "[[:keyword:]]") >= 0
  local popup_closed = vim.fn.pumvisible() == 0
  return is_keyword and popup_closed
end

local function is_lsp_trigger(char)
  for _, client in ipairs(vim.lsp.get_clients()) do
    local completion_provider = client.server_capabilities.completionProvider

    if completion_provider then
      local triggers = completion_provider.triggerCharacters or {}
      if vim.tbl_contains(triggers, char) then return true end
    end
  end

  return false
end

vim.api.nvim_create_autocmd("InsertCharPre", {
  callback = function()
    ---@diagnostic disable-next-line: need-check-nil
    completion_timer:stop()

    local char = vim.v.char
    if should_trigger_completion(char) or is_lsp_trigger(char) then
      ---@diagnostic disable-next-line: need-check-nil
      completion_timer:start(
        COMPLETION_DELAY_MS,
        0,
        vim.schedule_wrap(vim.lsp.completion.get)
      )
    end
  end,
})

vim.keymap.set("i", "<C-n>", function()
  if vim.fn.pumvisible() ~= 0 then
    vim.api.nvim_feedkeys("", "n", true)
  else
    vim.lsp.completion.get()
  end
end)

vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-e><CR>"
  end
  return "<CR>"
end, { expr = true })
