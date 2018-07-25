set nocompatible

" change the mapleader from \ to ,
let mapleader=","

set nobackup
set autoindent
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set laststatus=2       " Always display the status line
set autowrite

" Persistent undo
set undodir=~/.vim/undodir
set undofile

" Fix for slow ruby syntax
" https://github.com/vim-ruby/vim-ruby/issues/243
" https://github.com/vim/vim/issues/282
set regexpengine=1
set ttyfast
set lazyredraw

set scrolloff=3

set clipboard+=unnamed
set backspace=indent,eol,start

" Bundler
au BufNewFile,BufRead Gemfile set filetype=ruby

" Mouse support
set mouse=a

set wildmode=list:longest,list:full
set complete=.,w,t
