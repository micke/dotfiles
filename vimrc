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

" Fix for slow ruby syntax
" https://github.com/vim-ruby/vim-ruby/issues/243
" https://github.com/vim/vim/issues/282
set regexpengine=1
set ttyfast
set lazyredraw

" Declare bundles are handled via Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Define bundles via Github repos
Plugin 'wincent/terminus'
Plugin 'danro/rename.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanki/treetop.vim'
Plugin 'timcharper/textile.vim'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-rbenv'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/greplace.vim'
Plugin 'xenoterracide/html.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'jamessan/vim-gnupg'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'vim-scripts/argtextobj.vim'

Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_ctags_executable_ruby = 'ripper-tags --ignore-unsupported-options'

Plugin 'airblade/vim-gitgutter'
autocmd BufWritePost * GitGutter

Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Plugin 'derekwyatt/vim-scala'
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces= '\(controllers\|views\|models\|libs\|utils\|services\|formatters\)'

Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutFastWrap = '<M-w>'
let g:AutoPairsFlyMode = 1

Plugin 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete " Delete fugitive buffers

Plugin 'thoughtbot/vim-rspec'
let g:rspec_command = 'Dispatch rspec {spec}'

Plugin 'mattn/gist-vim'
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_mode_map = { "mode": "active",
                           \ "passive_filetypes": ["scala"] }

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {
  \ 'guifgs': ['white', 'red', 'darkgreen', 'darkblue', 'brown', 'darkred', 'cyan'],
  \ 'ctermfgs': ['white', 'red', 'darkgreen', 'darkblue', 'brown', 'darkred', 'cyan']
  \}

call vundle#end()
filetype plugin indent on

set scrolloff=3

set statusline=%10f       " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%{gutentags#statusline()}
set statusline+=\         " Space
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

" Fix bug where VIM sometimes start with line cursor
autocmd VimEnter * silent exec "! echo -ne '\e[2 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[6 q'" 

" Syntax highlightning
syntax on

" Bundler
au BufNewFile,BufRead Gemfile set filetype=ruby

" Theming
set background=dark
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
map <Leader>d :Dispatch<CR>

map <Leader>q :%s/\'\([^']*\)\'/"\1"/g<CR>

" Fugitive mappings
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gbl :Gblame<CR>
nnoremap <Leader>gbr :Gbrowse<CR>
nnoremap <Leader>gpl :Gpull<CR>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>

" Config mappings
nnoremap <Leader>cc :e ~/.dotfiles/vimrc<CR>
nnoremap <Leader>cs :so ~/.dotfiles/vimrc<CR>
nnoremap <Leader>pi :PluginInstall<CR>
nnoremap <Leader>pu :PluginUpdate<CR>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>

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

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile conf/messages.* set filetype=jproperties

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
set number

" Display current line in a different color
set cursorline

" Do not wrap and color column 80
set nowrap
set colorcolumn=80
autocmd FileType scala setlocal colorcolumn=100

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
