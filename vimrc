set nocompatible

" change the mapleader from \ to ,
let mapleader=","

set nobackup
set autoindent
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite

set ttyfast
set lazyredraw

" Declare bundles are handled via Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Bundle "gmarik/Vundle.vim"

" Define bundles via Github repos
Bundle "danro/rename.vim"
Bundle "kchmck/vim-coffee-script"
Bundle "kien/ctrlp.vim"
Bundle "nanki/treetop.vim"
Bundle "timcharper/textile.vim"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-unimpaired"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-vinegar"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-dispatch"
Bundle "tpope/vim-rhubarb"
Bundle "vim-scripts/matchit.zip"
Bundle "vim-scripts/ctags.vim"
Bundle "vim-scripts/greplace.vim"
Bundle "xenoterracide/html.vim"
Bundle "terryma/vim-multiple-cursors"
Bundle "godlygeek/tabular"
Bundle "derekwyatt/vim-scala"
Bundle "rking/ag.vim"
Bundle "jamessan/vim-gnupg"
Bundle "christoomey/vim-tmux-navigator"
Bundle "ervandew/supertab"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "vim-ruby/vim-ruby"

Bundle "tpope/vim-fugitive"
autocmd BufReadPost fugitive://* set bufhidden=delete " Delete fugitive buffers

Bundle 'Raimondi/delimitMate'
let g:delimitMate_expand_space = 1

Bundle "thoughtbot/vim-rspec"
let g:rspec_command = "Dispatch rspec {spec}"


Bundle "mattn/gist-vim"
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

Bundle "nathanaelkane/vim-indent-guides"
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

Bundle "scrooloose/syntastic"
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

call vundle#end()
filetype plugin indent on

set scrolloff=3

set statusline=%10f       " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=:%c       " Column number
set statusline+=/         " Separator
set statusline+=%L        " Total lines
set statusline+=\         " Space
set statusline+=[%{fugitive#head(7)}]

set cryptmethod=blowfish
set noesckeys
set clipboard+=unnamed
set backspace=indent,eol,start

" Colors
autocmd VimEnter,Colorscheme * :hi CursorLine       ctermbg=0
autocmd VimEnter,Colorscheme * :hi CursorLineNr     ctermbg=0
autocmd VimEnter,Colorscheme * :hi StatusLine       ctermfg=2
autocmd VimEnter,Colorscheme * :hi StatusLineNC     ctermfg=0

" Syntax highlightning
syntax on

" Bundler
au BufNewFile,BufRead Gemfile set filetype=ruby

" Theming
set background=dark
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

" Use Ag over Grep
set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Mouse support
set mouse=a
set ttymouse=xterm2

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

nmap <Leader><Leader> <c-^>
nmap <Leader>h :rightbelow split<CR> " Split window horizontal
nmap <Leader>v :rightbelow vsplit<CR> " Split window vertically
nmap <Leader>av :AV<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Fugitive mappings
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gbl :Gblame<CR>
nnoremap <Leader>gbr :Gbrowse<CR>
nnoremap <Leader>gpl :Dispatch git pull<CR>
nnoremap <Leader>gps :Dispatch git push<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Numbers
set relativenumber
set numberwidth=5

" Display current line in a different color
set cursorline

" Do not wrap and color column 80
set nowrap
set colorcolumn=80

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
