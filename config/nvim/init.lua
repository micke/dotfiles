-- load all plugins
require "plugins"
require "settings"

require "statusline"
require "vim-matchup"
require "splitjoin"
require "diagnostics"

require("colorizer").setup()
require("neoscroll").setup({
  hide_cursor = false
})

-- lsp stuff
require "nvim-lspconfig"

local cmd = vim.cmd
local g = vim.g

g.mapleader = ","
g.auto_save = 0

-- colorscheme related stuff
cmd "syntax on"

-- Tokyonight
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- cmd "colorscheme tokyonight"

-- Nightfox
local nightfox = require("nightfox")
nightfox.setup({
  fox = "hybridfox",
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold"
  }
})
nightfox.load()

-- Onedark
-- require("onedark").setup({
--   comment_style = "italic",
--   keyword_style = "bold",
--   function_style = "italic,bold",
--   sidebars = {"qf", "vista_kind", "terminal", "packer"},
-- })

-- Onedark Pro
-- require("onedarkpro").load()

g["test#strategy"] = "dispatch"

require "file-icons"

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("lspkind").init()

-- hide line numbers , statusline in specific buffers!
-- vim.api.nvim_exec([[
--   au bufenter term://* setlocal nonumber
--   au bufenter,bufwinenter,winenter,cmdwinenter * if bufname('%') == "nvimtree" | set laststatus=0 | else | set laststatus=2 | endif
--   au bufenter term://* set laststatus=0 
-- ]], false)

-- Open files in last position
vim.cmd([[
augroup openfile
  au BufReadPost * if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup end
]])

vim.cmd([[
function! Browse(pathOrUrl)
  if has('mac')| let openCmd = 'open'| else| let openCmd = 'xdg-open'| endif
    silent execute "! " . openCmd . " " . shellescape(a:pathOrUrl, 1)|
endfunction

command! -nargs=1 Browse call Browse(<q-args>)|
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

-- Autoformat on save
vim.api.nvim_exec([[
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync(nil, 1000)
]], false)

vim.api.nvim_exec([[
function! SynStack()
  for i1 in synstack(line("."), col("."))
    let i2 = synIDtrans(i1)
    let n1 = synIDattr(i1, "name")
    let n2 = synIDattr(i2, "name")
    echo n1 "->" n2
  endfor
endfunction

map <leader>hl <cmd>call SynStack()<cr>
]], false)

-- vim.cmd "autocmd BufRead,BufNewFile *.ex,*.exs,mix.lock set filetype=elixir"

require "mappings"
require "whichkey"
require "argwrap"
require("nvim_comment").setup()
