-- Enable hybrid line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Always enable the sign column
vim.o.signcolumn = "yes"

-- Better searching
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- Preserve undo history
vim.o.undofile = true

-- Open new splits below and right instead of above and left
vim.o.splitbelow = true
vim.o.splitright = true

-- Keep some space above and below the cursor
vim.o.scrolloff = 10

-- Display tabs as 4 spaces
vim.o.tabstop = 4

-- Hide markup syntax
vim.o.conceallevel = 2

-- Disable swap files since they are basically useless
-- and very annoying
vim.o.swapfile = false

-- Better line wrapping
vim.o.breakindent = true
vim.o.linebreak = true

-- Show preview for :s
vim.o.inccommand = "split"

-- Disable spel chekign
vim.o.spell = false

-- Show healthchecks in a floating window
vim.g.health = { style = "float" }
