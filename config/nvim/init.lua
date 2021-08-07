-- load all plugins
require "plugins"
require "settings"

require "statusline"
require "vim-matchup"
require "splitjoin"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp stuff
require "nvim-lspconfig"
require "compe-completion"

local cmd = vim.cmd
local g = vim.g

g.mapleader = ","
g.auto_save = 0

-- colorscheme related stuff
cmd "syntax on"

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true

cmd "colorscheme tokyonight"

-- blankline

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

require "treesitter-nvim"

require "nvimTree"
require "file-icons"

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require "autopairs"
require("lspkind").init()

-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec([[
  au bufenter term://* setlocal nonumber
  au bufenter,bufwinenter,winenter,cmdwinenter * if bufname('%') == "nvimtree" | set laststatus=0 | else | set laststatus=2 | endif
  au bufenter term://* set laststatus=0 
]], false)

-- Open files in last position
vim.cmd([[
augroup openfile
  au BufReadPost * if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup end
]])

vim.api.nvim_exec([[
augroup highlight_yank
  autocmd!
  au textyankpost * silent! lua vim.highlight.on_yank { higroup='incsearch', timeout=1000 }
augroup end
]], false)

vim.api.nvim_exec([[
command! WQ wq
command! Wq wq
command! W w
command! Q q
]], false)

-- vim.cmd "autocmd BufRead,BufNewFile *.ex,*.exs,mix.lock set filetype=elixir"

require "mappings"
require "whichkey"
require "argwrap"
require("nvim_comment").setup()
