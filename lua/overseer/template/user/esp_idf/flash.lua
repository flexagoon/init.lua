return {
  name = "Flash to ESP",
  builder = function()
    return {
      cmd = { "idf.py" },
      args = { "flash" },
      cwd = vim.lsp.buf.list_workspace_folders()[1],
      components = { { "open_output", focus = true }, { "run_after", task_names = { "user.esp_idf.monitor" } }, "default" },
    }
  end,
  condition = {
    callback = function()
      return vim.fn.executable("idf.py") == 1
    end,
  },
}
