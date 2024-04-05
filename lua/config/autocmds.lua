-- Open help in vertical split if there is enough space
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "help" and vim.o.columns / 2 >= 80 then
      vim.cmd("wincmd L")
    end
  end
})
