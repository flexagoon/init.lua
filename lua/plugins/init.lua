-- Load all plugin configs
local config_path = vim.fn.stdpath("config")
for cfg in vim.fs.dir(config_path .. "/lua/plugins") do
  if cfg ~= "init.lua" then
    local name = cfg:gsub(".lua", "")
    require("plugins." .. name)
  end
end

-- Other plugins
vim.pack.add({
  -- Automatic indentation
  "https://github.com/NMAC427/guess-indent.nvim",

  -- Track my activity with ActivityWatch
  "https://github.com/ActivityWatch/aw-watcher-vim",
})

require("guess-indent").setup()
