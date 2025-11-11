vim.pack.add({ {
  src = "https://github.com/nvim-treesitter/nvim-treesitter",
  version = "main",
} })

local ts = require("nvim-treesitter")
local langs = ts.get_available()

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)

    if not vim.tbl_contains(langs, lang) then
      return
    end

    ts.install({ lang }):await(function()
      vim.treesitter.start(args.buf, lang)
    end)
  end,
})
