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
set incsearch          " do incremental searching
set inccommand=nosplit " preview search and replace edit
set nohlsearch         " remove search highlights when search is complete
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

" Declare bundles are handled via Vundle
set rtp+=~/.config/nvim/bundle/hybrid-redux
call plug#begin('~/.vim/plugged')

" Define bundles via Github repos
Plug 'danro/rename.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'nanki/treetop.vim'
Plug 'timcharper/textile.vim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-git'
Plug 'andymass/vim-matchup'
Plug 'vim-scripts/ctags.vim'
Plug 'vim-scripts/greplace.vim'
Plug 'xenoterracide/html.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'jamessan/vim-gnupg'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/argtextobj.vim'
Plug 'ngmy/vim-rubocop'
Plug 'glts/vim-textobj-comment'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'slim-template/vim-slim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'gerw/vim-HiLinkTrace'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <space> :Files<CR>

Plug 'chrisbra/Colorizer'

Plug 'vim-ruby/vim-ruby'
let g:ruby_indent_block_style = 'do'

Plug 'w0rp/ale'
let g:ale_fixers = {
\   'ruby': [
\       'rubocop'
\   ],
\}
map <leader>f :ALEFix<CR>

Plug 'FooSoft/vim-argwrap'
let g:argwrap_padded_braces = '{'
nnoremap <silent> <leader>w :ArgWrap<CR>

Plug 'vim-airline/vim-airline'
let g:airline_theme = "hybrid"

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

" Stores a session file and automatically starts vim from the previous session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_ctags_executable_ruby = 'rtags'

Plug 'airblade/vim-gitgutter'
autocmd BufWritePost * GitGutter
set updatetime=100
set signcolumn=yes

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Plug 'derekwyatt/vim-scala'
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces= '\(controllers\|views\|models\|libs\|utils\|services\|formatters\)'

Plug 'Raimondi/delimitMate'
let g:delimitMate_expand_space=1
let g:delimitMate_expand_cr=2
let g:delimitMate_jump_expansion=1
inoremap <expr> <C-j> delimitMate#JumpAny()

" vim-endwise needs to load after delimitMate
Plug 'tpope/vim-endwise'

Plug 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete " Delete fugitive buffers

Plug 'thoughtbot/vim-rspec'
let g:rspec_command = 'Dispatch rspec {spec}'

Plug 'mattn/gist-vim'
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

call plug#end()

set scrolloff=3

" Theming
set termguicolors
set background=dark
colorscheme hybrid
au VimEnter * colorscheme hybrid
au VimEnter * AirlineRefresh

" Deoplete
call deoplete#custom#option('smart_case', v:true)

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', '%3v'])
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#obsession#enabled = 0

set clipboard+=unnamed
set backspace=indent,eol,start

" Bundler
au BufNewFile,BufRead Gemfile set filetype=ruby

" Use Ag over Grep
set grepprg=ag\ --nogroup\ --nocolor

" Mouse support
set mouse=a

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

nmap <leader><Leader> <c-^>
nmap <leader>h :rightbelow split<CR>
nmap <leader>v :rightbelow vsplit<CR>
nmap <leader>av :AV<CR>
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>
map <leader>d :Dispatch<CR>
map <leader>r :RuboCop<CR>

" Tab bindings
map <M-l> :tabnext<CR>
map <M-k> :tablast<CR>
map <M-j> :tabfirst<CR>
map <M-h> :tabprevious<CR>

" Tag bindings
nnoremap <silent><expr> <c-w><c-]> ':<c-u>'.(winwidth(0) > 79 ? 'vert' : '').' wincmd ]<cr>'
nnoremap <silent><expr> <c-w>] ':<c-u>'.(winwidth(0) > 79 ? 'vert' : '').' wincmd ]<cr>'
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Convert all single quoted strings to double quotes
nnoremap <leader>q :%s/\'\([^']*\)\'/"\1"/g<CR>

" Remove all trailing whitespaces
" nnoremap <leader>w :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Fugitive mappings
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
nnoremap <leader>go :Git checkout<space>

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
