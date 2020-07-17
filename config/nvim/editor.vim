set nocompatible

" change the mapleader from \ to ,
let mapleader=","

set hidden
set nobackup
set autoindent
set nowritebackup
set noswapfile         " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set autowrite
set diffopt+=vertical
set nojoinspaces
set gdefault

set winwidth=80

" Fix for slow ruby syntax
" https://github.com/vim-ruby/vim-ruby/issues/243
" https://github.com/vim/vim/issues/282
set regexpengine=1
set lazyredraw

" Persistent undo
set undodir=~/.vim/undodir
set undofile

set scrolloff=3

set clipboard+=unnamed
set backspace=indent,eol,start

" Mouse support
set mouse=a

set wildmode=longest:full,list:full
set complete=.,w,t
set completeopt=noinsert,menuone,noselect

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:>\ ,trail:-,nbsp:+

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Numbers
set relativenumber
set number

" Netrw
let g:netrw_rmdir_cmd='rm -r'

" Display current line in a different color
" set cursorline

" Do not wrap and color column 80
set nowrap

" Statusline
set laststatus=2          " Always display the status line

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

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile conf/messages.* set filetype=jproperties
  autocmd BufRead,BufNewFile Gemfile set filetype=ruby
augroup END

augroup quickfix
  autocmd!
  autocmd FileType qf setlocal nolist wrap linebreak
augroup END

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
