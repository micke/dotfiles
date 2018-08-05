call plug#begin('~/.vim/plugged')

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/Colorizer'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'FooSoft/vim-argwrap'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'derekwyatt/vim-scala'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise' " vim-endwise needs to load after delimitMate
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec'
Plug 'mattn/gist-vim'

call plug#end()

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)

" junegunn/fzf
nnoremap <space> :Files<CR>

" vim-ruby/vim-ruby
let g:ruby_indent_block_style = 'do'

" w0rp/ale
let g:ale_fixers = {
\   'ruby': [
\       'rubocop'
\   ],
\}
map <leader>f :ALEFix<CR>

" FooSoft/vim-argwrap
let g:argwrap_padded_braces = '{'
nnoremap <silent> <leader>w :ArgWrap<CR>

" vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', '%3v'])
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#obsession#enabled = 0

" nathanaelkane/vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

" ludovicchabant/vim-gutentags
let g:gutentags_ctags_executable_ruby = 'rtags'

" airblade/vim-gitgutter
autocmd BufReadPost,BufWritePost * GitGutter
set updatetime=100
set signcolumn=yes

" mileszs/ack.vim
let g:ackprg = 'ag --vimgrep'

" Raimondi/vim-scala
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces= '\(controllers\|views\|models\|libs\|utils\|services\|formatters\)'

" Raimondi/delimitMate
let g:delimitMate_expand_space=1
let g:delimitMate_expand_cr=2
let g:delimitMate_jump_expansion=1
inoremap <expr> <C-j> delimitMate#JumpAny()

" tpope/vim-fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete " Delete fugitive buffers
" Delete git buffers spawned by fugitive through neovim-remote
autocmd BufReadPost,BufNewFile .git/**/* set bufhidden=delete 
autocmd BufReadPost,BufNewFile .git/* set bufhidden=delete 
autocmd TermOpen * set bufhidden=delete 

" thoughtbot/vim-rspec
let g:rspec_command = 'Dispatch rspec {spec}'

" mattn/gist-vim
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'
