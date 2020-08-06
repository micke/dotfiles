call plug#begin('~/.config/nvim/plug')

Plug 'sheerun/vim-polyglot'
Plug 'micke/vim-hybrid'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rsi'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'wellle/targets.vim'
Plug 'andymass/vim-matchup'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomtom/tlib_vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tek/vim-textobj-ruby'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'glts/vim-textobj-comment'
Plug 'michaeljsmith/vim-indent-object'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/dsf.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'tweekmonster/fzf-filemru'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'FooSoft/vim-argwrap'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise' " vim-endwise needs to load after delimitMate
Plug 'tpope/vim-fugitive'
Plug 'janko-m/vim-test'
Plug 'mattn/webapi-vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'machakann/vim-highlightedyank'
Plug 'AndrewRadev/deleft.vim'
Plug 'luochen1990/rainbow'
Plug 'rhysd/git-messenger.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'justinmk/vim-gtfo'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-after-object'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jasontbradshaw/pigeon.vim'
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()
