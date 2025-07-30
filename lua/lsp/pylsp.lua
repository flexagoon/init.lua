return {
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
}
