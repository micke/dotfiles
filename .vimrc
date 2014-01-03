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
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Define bundles via Github repos
Bundle 'danro/rename.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'nanki/treetop.vim'
Bundle 'timcharper/textile.vim'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/greplace.vim'
Bundle 'vim-scripts/tComment'
Bundle 'xenoterracide/html.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'godlygeek/tabular'
Bundle 'elixir-lang/vim-elixir'
Bundle 'derekwyatt/vim-scala'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-dispatch'

Bundle 'thoughtbot/vim-rspec'
let g:rspec_command = "Dispatch rspec {spec}"

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

Bundle "vim-ruby/vim-ruby"
Bundle "ervandew/supertab"
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1

Bundle 'mattn/gist-vim'
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'
Bundle 'stephenmckinney/vim-solarized-powerline'
let g:Powerline_colorscheme='solarized16'

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#002b36 ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#073642 ctermbg=0
autocmd VimEnter,Colorscheme * :hi CursorLine       guibg=#073642 ctermbg=0
autocmd VimEnter,Colorscheme * :hi CursorLineNr     guibg=#073642 ctermbg=0

Bundle 'majutsushi/tagbar'
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1

Bundle 'Raimondi/delimitMate'
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

filetype plugin indent on

set scrolloff=3

set clipboard+=unnamed

" Syntax highlightning
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Bundler
au BufNewFile,BufRead Gemfile set filetype=ruby

" Guard
au BufNewFile,BufRead Guardfile,.Guardfile set filetype=ruby

" Vagrant
au BufNewFile,BufRead [vV]agrantfile set filetype=ruby

" Theming
set background=dark
colorscheme solarized

" Use Ag
let g:ackprg = 'ag --nogroup --nocolor --column'
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
nmap <Leader>t :TagbarToggle<CR> " Toggle tagbar
nmap <Leader>h :rightbelow split<CR> " Split window horizontal
nmap <Leader>v :rightbelow vsplit<CR> " Split window vertically
nmap <Leader>s :Ack
nmap <Leader>d :tj <C-r><C-w><CR> " Jump to tag
nmap <Leader>D :rightbelow vsplit<CR> :tj <C-r><C-w><CR> " Split window and jump to tag
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Fugitive mappings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

nnoremap <Leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR> " Insert blank line below cursor
nnoremap <Leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR> " Insert blank line above cursor

" Go to end of line
noremap L g_
" Go to beginning of line
noremap H ^

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

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Do not wrap and color column 80
set nowrap
set colorcolumn=80
