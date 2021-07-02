local o, g = vim.o, vim.g

g.mapleader = ","

o.compatible = false
o.hidden = true
o.backup = false
o.autoindent = true
o.writebackup = false
o.swapfile = false
o.history = 500
o.ruler = true
o.showcmd = true
o.autowrite = true
o.diffopt = o.diffopt .. ",vertical"
o.joinspaces = false
o.gdefault = true

o.winwidth = 80

-- Fix for slow ruby syntax
-- https://github.com/vim-ruby/vim-ruby/issues/243
-- https://github.com/vim/vim/issues/282
o.regexpengine = 1
o.lazyredraw = true

-- Persistent undo
o.undodir = "~/.vim/undodir"
o.undofile = true

o.scrolloff = 3

o.clipboard = "unnamed"
o.backspace = "indent,eol,start"

-- Mouse support
o.mouse = "a"

o.wildmode = "longest:full,list:full"
o.complete = ".,w,t"
o.completeopt = "noinsert,menuone,noselect"

o.formatoptions = string.gsub(vim.o.formatoptions, '[at]', '') -- Disable autoformatting
o.formatoptions = vim.o.formatoptions .. 'c' -- Respect textwidth in comments
o.formatoptions = vim.o.formatoptions .. 'q' -- Format comments with gq
o.formatoptions = string.gsub(vim.o.formatoptions, '[o]', '') -- Don't continue comments with o and O
o.formatoptions = vim.o.formatoptions .. 'r' -- Enter continues comments
o.formatoptions = vim.o.formatoptions .. 'n' -- Indent past the formatlistpat, not underneath it.
o.formatoptions = vim.o.formatoptions .. 'j' -- Auto-remove comments if possible.
o.formatoptions = string.gsub(vim.o.formatoptions, '2', '')

-- Softtabs, 2 spaces
o.tabstop = 2
o.shiftwidth = o.tabstop
o.expandtab = true

-- Display extra whitespace
o.list = true
o.listchars = "tab:> ,trail:-,nbsp:+"

-- Open new split panes to right and bottom, which feels more natural
o.splitbelow = true
o.splitright = true

-- Numbers
o.relativenumber = true
o.number = true

-- Netrw
g.netrw_rmdir_cmd = "rm -r"

-- Do not wrap and color column 80
o.wrap = false

-- Statusline
o.laststatus = 2 -- Always display the status line

vim.cmd("command WQ wq")
vim.cmd("command Wq wq")
vim.cmd("command W w")
vim.cmd("command Q q")

-- Local config
if vim.fn.filereadable("~/.vimrc.local") == 1 then
  vim.fn.source("~/.vimrc.local")
end
