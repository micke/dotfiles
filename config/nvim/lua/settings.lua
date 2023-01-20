local o = vim.o
local b = vim.bo
local w = vim.wo

o.compatible = false
o.hidden = true
o.backup = false
o.autoindent = true
o.writebackup = false
o.swapfile = false
o.history = 500
o.ruler = false
o.showcmd = true
o.showmode = false
o.autowrite = true
o.ignorecase = true
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.joinspaces = false
o.gdefault = true
o.wrap = false
o.spell = false
o.scrolloff = 3

o.wildmode = "longest:full,list:full"

o.undodir = vim.fn.expand("~/.vim/undodir")
o.undofile = true

o.mouse = "a"

w.signcolumn = "yes"
o.cmdheight = 1

o.updatetime = 250
o.clipboard = "unnamedplus"

w.number = true
o.numberwidth = 2
o.relativenumber = true

o.incsearch = true
o.inccommand = "nosplit"
o.grepprg = "rg --vimgrep"

b.expandtab = true
b.shiftwidth = 2
b.smartindent = true

o.formatoptions = string.gsub(vim.o.formatoptions, "[at]", "") -- Disable autoformatting
o.formatoptions = vim.o.formatoptions .. "c" -- Respect textwidth in comments
o.formatoptions = vim.o.formatoptions .. "q" -- Format comments with gq
o.formatoptions = string.gsub(vim.o.formatoptions, "[o]", "") -- Don"t continue comments with o and O
o.formatoptions = vim.o.formatoptions .. "r" -- Enter continues comments
o.formatoptions = vim.o.formatoptions .. "n" -- Indent past the formatlistpat, not underneath it.
o.formatoptions = vim.o.formatoptions .. "j" -- Auto-remove comments if possible.
o.formatoptions = string.gsub(vim.o.formatoptions, "2", "")
