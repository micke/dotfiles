" junegunn/fzf

nnoremap <space>f :FilesMru<CR>
nnoremap <space>F :Files<CR>
nnoremap <space>t :Tags<CR>
nnoremap <space>r :Rg<CR>
nnoremap <space>c :Commits<CR>

" vim-ruby/vim-ruby
let g:ruby_path = system('rbenv prefix')
let g:ruby_indent_block_style = 'do'

" w0rp/ale
let g:ale_cache_executable_check_failures = 1
let g:ale_virtualenv_dir_names = []
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': [
\     'rubocop',
\   ],
\}
let g:ale_pattern_options = {
\   '.*\.ex$': {'ale_enabled': 0},
\   '.*\.exs$': {'ale_enabled': 0},
\}
map <leader>f :ALEFix<CR>

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" FooSoft/vim-argwrap
let g:argwrap_padded_braces = '{'
nnoremap <silent> <leader>w :ArgWrap<CR>

let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2
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
inoremap <expr> <C-l> delimitMate#JumpAny()

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
let g:projectionist_ignore_term = 1

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

" coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <silent><expr> <CR> pumvisible() ? "\<C-y><CR>" : "\<Plug>delimitMateCR<Plug>DiscretionaryEnd"

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` for navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Shortcuts for denite interface
" Show extension list
nnoremap <silent> <space>de  :<C-u>Denite coc-extension<cr>
" Show symbols of current buffer
nnoremap <silent> <space>do  :<C-u>Denite coc-symbols<cr>
" Search symbols of current workspace
nnoremap <silent> <space>dt  :<C-u>Denite coc-workspace<cr>
" Show diagnostics of current workspace
nnoremap <silent> <space>da  :<C-u>Denite coc-diagnostic<cr>
" Show available commands
nnoremap <silent> <space>dc  :<C-u>Denite coc-command<cr>
" Show available services
nnoremap <silent> <space>ds  :<C-u>Denite coc-service<cr>
" Show links of current buffer
nnoremap <silent> <space>dl  :<C-u>Denite coc-link<cr>

" junegunn/vim-easy-align

let g:easy_align_delimiters = {
\  '>': { 'pattern': '->',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 }
\ }

" luochen1990/rainbow
let g:rainbow_active = 1
