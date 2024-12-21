-- Enable hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Always enable the sign column
vim.opt.signcolumn = "yes"

-- Better searching
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preserve undo history
vim.opt.undofile = true

-- Set a soft 80 character line limit
vim.opt.colorcolumn = "80"

-- Open new splits below and right instead of above and left
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Keep some space above and below the cursor
vim.opt.scrolloff = 10

-- Display tabs as 4 spaces
vim.opt.tabstop = 4

-- Hide markup syntax
vim.opt.conceallevel = 2

-- Disable swap files since they are basically useless
-- and very annoying
vim.opt.swapfile = false

-- Better line wrapping
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Show preview for :s
vim.opt.inccommand = "split"

-- Disable spel chekign
vim.opt.spell = false
