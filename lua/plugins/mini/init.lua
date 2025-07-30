--- Various utility mini-plugins

vim.pack.add({ "https://github.com/echasnovski/mini.nvim" })

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
require("mini.surround").setup()
require("mini.ai").setup()

require("plugins.mini.files")
require("plugins.mini.diff")
require("plugins.mini.pick")
