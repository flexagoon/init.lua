return {
  name = "Flash to ESP and monitor",
  builder = function()
    return {
      cmd = { "idf.py" },
      args = { "flash", "monitor" },
      cwd = vim.lsp.buf.list_workspace_folders()[1],
      components = {
        {
          "open_output",
          direction = "vertical",
          focus = true,
        },
        "user.on_close_dispose",
        "unique",
        "default",
      },
    }
  end,
  condition = {
    callback = function()
      return vim.fn.executable("idf.py") == 1
    end,
  },
}
