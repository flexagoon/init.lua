-- Open help in vertical split if there is enough space
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    if vim.bo.buftype == "help" and vim.o.columns / 2 >= 80 then
      vim.cmd("wincmd L")
    end
  end,
})

-- Correct syntax highlighting in chezmoi template files
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = vim.fn.expand("~") .. "/.local/share/chezmoi/*.tmpl",
  callback = function()
    local filename = vim.fn.expand("%:p")
    local original_filename =
        filename
        :gsub("%.local/share/chezmoi/", "")
        :gsub("/dot_", ".")
        :gsub("%.tmpl$", "")
    local filetype = vim.filetype.match({
      buf = 0,
      filename = original_filename,
    })
    vim.bo.filetype = filetype
  end,
})
