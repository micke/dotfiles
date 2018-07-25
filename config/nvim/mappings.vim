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
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

nmap <leader><Leader> <c-^>
nmap <leader>h :rightbelow split<CR>
nmap <leader>v :rightbelow vsplit<CR>
nmap <leader>av :AV<CR>
nmap <leader>t :call RunCurrentSpecFile()<CR>
nmap <leader>s :call RunNearestSpec()<CR>
nmap <leader>l :call RunLastSpec()<CR>
nmap <leader>a :call RunAllSpecs()<CR>
nmap <leader>d :Dispatch<CR>
nmap <leader>r :RuboCop<CR>

" Tag bindings
nnoremap <silent><expr> <c-w><c-]> ':<c-u>'.(winwidth(0) > 79 ? 'vert' : '').' wincmd ]<cr>'
nnoremap <silent><expr> <c-w>] ':<c-u>'.(winwidth(0) > 79 ? 'vert' : '').' wincmd ]<cr>'
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Convert all single quoted strings to double quotes
nnoremap <leader>q :%s/\'\([^']*\)\'/"\1"/g<CR>

" Remove all trailing whitespaces
nnoremap <leader>tw :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Fugitive
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>gbr :Gbrowse<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>ga :Gcommit -a<CR>
nnoremap <leader>go :Git co<space>

" Config mappings
nnoremap <leader>cc :e $MYVIMRC<CR>
nnoremap <leader>cs :so $MYVIMRC<CR>:AirlineRefresh<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>

nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>
nmap <leader>a, :Tabularize /,\zs<CR>
vmap <leader>a, :Tabularize /,\zs<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
