return {
  name = "Monitor ESP output",
  builder = function()
    return {
      cmd = { "idf.py" },
      args = { "monitor" },
      cwd = vim.lsp.buf.list_workspace_folders()[1],
      components = {
        {
          "open_output",
          direction = "float",
          focus = true,
        },
        "user.on_close_dispose",
        { "unique", replace = false },
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
