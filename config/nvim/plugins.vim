call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-unimpaired'
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
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'jamessan/vim-gnupg'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/argtextobj.vim'
Plug 'glts/vim-textobj-comment'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gerw/vim-HiLinkTrace'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'FooSoft/vim-argwrap'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise' " vim-endwise needs to load after delimitMate
Plug 'tpope/vim-fugitive'
Plug 'janko-m/vim-test'
Plug 'SirVer/ultisnips'
Plug 'bkad/CamelCaseMotion'
Plug 'mattn/webapi-vim'
Plug 'carakan/pmv.vim'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/vim-peekaboo'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-gtags'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" Shougo/deoplete.nvim
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" call deoplete#custom#option('smart_case', v:true)
" call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
" call deoplete#custom#source('ultisnips', 'rank', 1000)
" inoremap <expr> <C-n>  deoplete#mappings#manual_complete()

" junegunn/fzf
nnoremap <space> :Files<CR>

" vim-ruby/vim-ruby
let g:ruby_indent_block_style = 'do'

" w0rp/ale
let $MIX_ENV = 'test'
let g:ale_fixers = {
\   'ruby': [
\     'rubocop',
\   ],
\   'elixir': [
\     'mix_format'
\   ],
\}
map <leader>f :ALEFix<CR>

" FooSoft/vim-argwrap
let g:argwrap_padded_braces = '{'
nnoremap <silent> <leader>w :ArgWrap<CR>

let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', '%3v'])
let g:airline_skip_empty_sections = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = ''
let g:airline_symbols.linenr = ''

" nathanaelkane/vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

" ludovicchabant/vim-gutentags
let g:gutentags_file_list_command = 'rg --files --ignore-file=.tagignore'
let g:gutentags_ctags_executable_ruby = 'rtags'

" airblade/vim-gitgutter
autocmd BufReadPost,BufWritePost * GitGutter
autocmd BufWinLeave * GitGutterAll
set updatetime=100
set signcolumn=yes

" Raimondi/delimitMate
let g:delimitMate_expand_space=1
let g:delimitMate_expand_cr=2
let g:delimitMate_jump_expansion=1
" inoremap <expr> <C-j> delimitMate#JumpAny()

" tpope/vim-fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete " Delete fugitive buffers
" Delete git buffers spawned by fugitive through neovim-remote
autocmd BufReadPost,BufNewFile .git/**/* set bufhidden=delete
autocmd BufReadPost,BufNewFile .git/* set bufhidden=delete
autocmd TermOpen * set bufhidden=delete

" tpope/vim-projectionist
let g:projectionist_heuristics = {
  \   "mix.exs": {
  \     "lib/*.ex": {
  \       "type": "lib",
  \       "alternate": "test/{}_test.exs",
  \       "template": [
  \         "defmodule {capitalize|camelcase|dot} do",
  \         "end"
  \       ]
  \     },
  \     "test/*_test.exs": {
  \       "type": "test",
  \       "alternate": "lib/{}.ex",
  \       "template": [
  \         "defmodule {capitalize|camelcase|dot}Test do",
  \         "  use ExUnit.Case, async: true",
  \         "end"
  \       ]
  \     }
  \   }
  \ }

" janko-m/vim-test
let g:test#strategy = "dispatch"
let g:test#runner_commands = ['RSpec']

" mattn/gist-vim
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"

" bkad/CamelCaseMotion
call camelcasemotion#CreateMotionMappings('s')

" carakan/pmv.vim
let g:pmv_no_default_key_mappings = 1
nmap <leader>pl <Plug>(pmv-last-release)
nmap <leader>pa <Plug>(pmv-all-releases)
nmap <leader>pp <Plug>(pmv-append-release)
nmap <leader>pi <Plug>(pmv-package-info)
nmap <leader>pb <Plug>(pmv-open-repo-page)
nmap <leader>pd <Plug>(pmv-open-docs)

" roxma/nvim-yarp
autocmd BufEnter * call ncm2#enable_for_buffer()

" LanguageClient
autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658']
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
