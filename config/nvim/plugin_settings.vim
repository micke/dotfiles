" junegunn/fzf
nnoremap <silent> <space>f :FilesMru --tiebreak=end<CR>
nnoremap <silent> <space>F :Files<CR>
nnoremap <silent> <space>t :Tags<CR>
nnoremap <silent> <space>bt :BTags<CR>
nnoremap <silent> <space>r :Rg<CR>

nnoremap <silent> <space>c :Files app/controllers<CR>
nnoremap <silent> <space>m :Files app/models<CR>
nnoremap <silent> <space>j :Files app/jobs<CR>
nnoremap <silent> <space>v :Files app/views<CR>
nnoremap <silent> <space>s :Files app/services<CR>

nnoremap <silent> <leader>c :Commits<CR>
nnoremap <silent> <leader>b :BCommits<CR>

nnoremap <silent> <leader>gc :GBranches<CR>
nnoremap <silent> <leader>gcb :GBranches<CR>
nnoremap <silent> <leader>gcm :Git checkout master<CR>
nnoremap <silent> <leader>gpc :Gprcheckout<CR>

let g:fzf_mru_no_sort = 1

let g:fzf_action = {
  \ 'ctrl-s': 'vsplit',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Open fzf in floating window
set winblend=10

if exists('g:fzf_colors.bg')
  call remove(g:fzf_colors, 'bg')
endif

let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2 --layout=reverse'

function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    " call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    " let opts.row += 1
    " let opts.height -= 2
    " let opts.col += 2
    " let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" Rg with preview
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
" Don't search in path when using ripgrep
command! -bang -nargs=* RgNoPath call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

command! -bang Gcheckout call fzf#run(fzf#wrap(
      \ {
      \ 'source': 'git for-each-ref --count=100 --sort=-committerdate refs/heads/ --format="%(refname:short)"',
      \ 'sink': 'Git checkout',
      \ 'options': '+m'
      \ }, <bang>0))

function! s:prcheckout(line)
  let parts = split(a:line, ' ')
  execute 'Git pr checkout' substitute(parts[0], '#', '', '')
endfunction

command! -bang Gprcheckout call fzf#run(fzf#wrap(
      \ {
      \ 'source': 'hub pr list',
      \ 'sink': function('s:prcheckout'),
      \ 'options': '--ansi +m --bind "ctrl-s:execute(echo {} | cut -d'' '' -f4 | sed ''s/#//g'' | xargs hub pr show)"'
      \ }, <bang>0))

" vim-ruby/vim-ruby
let g:ruby_path = system('rbenv prefix')
let g:ruby_indent_block_style = 'do'

" vim-textobj-ruby
let g:textobj_ruby_no_mappings = 1

" w0rp/ale
set updatetime=100
set signcolumn=yes
let g:ale_cache_executable_check_failures = 1
let g:ale_virtualenv_dir_names = []
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': [
\     'rubocop',
\   ],
\   'terraform': ['terraform']
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
let g:projectionist_ignore_man = 1

" tpope/vim-surround
autocmd FileType ruby let b:surround_45 = "\1block: \1 do\r end"
autocmd FileType ruby let b:surround_99 = "class \1class: \1\r end"
autocmd FileType ruby let b:surround_100 = "def \1method: \1\r end"
autocmd FileType ruby let b:surround_109 = "module \1module: \1\r end"

" plasticboy/vim-markdown
let g:vim_markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'css']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" janko-m/vim-test
let g:test#strategy = "dispatch"
let g:test#runner_commands = ['RSpec']
let g:test#ruby#use_spring_binstub = 0

" mattn/gist-vim
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"

" carakan/pmv.vim
let g:pmv_no_default_key_mappings = 1
nmap <leader>pl <Plug>(pmv-last-release)
nmap <leader>pa <Plug>(pmv-all-releases)
nmap <leader>pp <Plug>(pmv-append-release)
nmap <leader>pi <Plug>(pmv-package-info)
nmap <leader>pb <Plug>(pmv-open-repo-page)
nmap <leader>pd <Plug>(pmv-open-docs)

" coc.nvim
set shortmess+=c
call coc#add_extension(
      \ 'coc-emoji',
      \ 'coc-solargraph',
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-yaml',
      \ 'coc-tag',
      \ 'coc-docker',
      \ 'coc-go',
      \ 'coc-elixir',
      \ 'coc-vetur',
      \)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

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

omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
omap ic <Plug>(coc-text-object-outer)
xmap ic <Plug>(coc-text-object-outer)

" junegunn/vim-easy-align

let g:easy_align_delimiters = {
\  '>': { 'pattern': '->',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 }
\ }

" luochen1990/rainbow
" let g:rainbow_active = 1

" itchyny/lightline.vim
set noshowmode " Don't show mode as lightline already shows mode
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction
function! LightlineRelativePath()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
let g:lightline = {
      \ 'colorscheme': 'hybrid',
      \ 'active': {
      \   'left':  [ [ 'mode' ],
      \              [ 'fugitive', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ] ]
      \ },
      \ 'inactive': {
      \   'left':  [ [ 'relativepath' ] ],
      \   'right': [ ['fugitive'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'relativepath': 'LightlineRelativePath'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
      \ },
      \ }

" splitjoin
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_trailing_comma = 1
let g:splitjoin_ruby_options_as_arguments = 1
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_align = 1

" git-messenger
let g:git_messenger_always_into_popup = 1
nmap gm <Plug>(git-messenger)

" vim-textobj-comment
let g:textobj_comment_no_default_key_mappings = 1
xmap ak <Plug>(textobj-comment-a)
omap ak <Plug>(textobj-comment-a)
xmap aK <Plug>(textobj-comment-big-a)
omap aK <Plug>(textobj-comment-big-a)
xmap ik <Plug>(textobj-comment-i)
omap ik <Plug>(textobj-comment-i)

" ludovicchabant/vim-gutentags	
let g:gutentags_file_list_command = 'rg --files --ignore-file=.tagignore'
let g:gutentags_ctags_executable_ruby = 'rtags'
let g:gutentags_define_advanced_commands = 1

" sbdchd/neoformat
" autocmd BufWritePre *.yaml Neoformat prettier
" autocmd BufWritePre *.yml Neoformat prettier
autocmd BufWritePre *.tf Neoformat terraform
autocmd BufWritePre *.tfvars Neoformat terraform

" vim-tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1

" fix netrw breaking <c-l>
augroup netrw_init
  autocmd!
  autocmd filetype netrw call NetrwInit()
augroup END

function! NetrwInit()
  nnoremap <silent> <buffer> <c-l> :TmuxNavigateRight<cr>
  call lightline#enable()
endfunction

" airblade/vim-gitgutter
let g:gitgutter_signs = 0
let g:gitgutter_highlight_linenrs = 1

" matchup
let g:matchup_surround_enabled = 1
let g:matchup_delim_stopline = 1500
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 1

" junegunn/vim-after-objec
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" jiangmiao/auto-pairs
let g:AutoPairsShortcutFastWrap = "<M-w>"

" Yggdroot/indentLine
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['help', 'defx', 'vimwiki']
let g:indentLine_color_gui = '#282a2e'

" posva/vim-vue
let g:vue_pre_processors = 'detect_on_enter'
