" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <silent><Tab> <c-r>=InsertTabWrapper()<cr>

nnoremap Y y$

" tnoremap <Esc> <C-\><C-n>

nmap <leader><Leader> <c-^>
nmap <leader>h :rightbelow split<CR>
nmap <leader>v :rightbelow vsplit<CR>
nmap <leader>av :AV<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>d :Dispatch<CR>

" Tag bindings
nnoremap <silent><expr> <c-w><c-]> ':<c-u>'.(winwidth(0) > 79 ? 'vert' : '').' wincmd ]<cr>'
nnoremap <silent><expr> <c-w>] ':<c-u>'.(winwidth(0) > 79 ? 'vert' : '').' wincmd ]<cr>'
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Convert all single quoted strings to double quotes
nnoremap <leader>q :%s/\'\([^']*\)\'/"\1"/g<CR>

" Remove all trailing whitespaces
nnoremap <leader>rtw :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Fugitive
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>gbr :Gbrowse<CR>
nnoremap <leader>gpl :Git pull<CR>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpf :Git push --force-with-lease<CR>
nnoremap <leader>gpp :Dispatch! git pp<CR>
nnoremap <leader>gpr :Dispatch! git p-r<CR>
nnoremap <leader>gpu :Dispatch! hub pushu<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>ga :Gcommit -a<CR>

" Split
nnoremap <C-\> <C-W>|
nnoremap <C-=> <C-W>=

" Config mappings
nnoremap <leader>ce :e $MYVIMRC<CR>
nnoremap <leader>cs :so $MYVIMRC<CR>
nnoremap <leader>cpi :PlugInstall<CR>
nnoremap <leader>cpu :PlugUpdate<CR>
nnoremap <leader>cpc :PlugClean<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Remap <C-c> to <C-a> (increment). As <C-a> is used by tmux
nnoremap <C-c> <C-a>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>
