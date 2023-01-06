local cmd = vim.cmd
local g = vim.g

g.mapleader = ","

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Set up lazy
require "config.lazy"
require "settings"

g.auto_save = 0

-- colorscheme related stuff
cmd "syntax on"

g["test#strategy"] = "dispatch"

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
})

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
autocmd BufWritePre *.tf lua vim.lsp.buf.format { async = false }
autocmd BufWritePre *.tfvars lua vim.lsp.buf.format { async = false }
autocmd BufWritePre *.ex lua vim.lsp.buf.format { async = false }
autocmd BufWritePre *.exs lua vim.lsp.buf.format { async = false }
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

require "mappings"
