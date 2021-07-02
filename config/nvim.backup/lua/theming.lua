local o, g = vim.o, vim.g

o.termguicolors = true
o.background = "dark"

vim.cmd "packadd! edge"
vim.cmd "colorscheme edge"
