return {
  desc = "Dispose the task when its output window is closed",
  constructor = function()
    return {
      _del_autocmd = function(self)
        if self.autocmd_id then
          vim.api.nvim_del_autocmd(self.autocmd_id)
          self.autocmd_id = nil
        end
      end,

      on_start = function(self, task)
        local bufnr = task:get_bufnr()
        self.autocmd_id = vim.api.nvim_create_autocmd("BufWinLeave", {
          buffer = bufnr,
          callback = function()
            task:dispose(true)
          end,
        })
      end,
      on_reset = function(self, _) self:_del_autocmd() end,
      on_dispose = function(self, _) self:_del_autocmd() end,
    }
  end,
}
