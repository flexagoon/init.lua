return {
  cmd = {
    vim.fs.find("clangd", { path = vim.env.IDF_TOOLS_PATH })[1],
    "--compile-commands-dir=build",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--fallback-style=llvm",
  },
  root_markers = { "sdkconfig", ".git" },
}
