call plug#begin('~/.config/nvim/plug')

Plug 'micke/vim-hybrid'
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
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'jamessan/vim-gnupg'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomtom/tlib_vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tek/vim-textobj-ruby'
Plug 'gilligan/textobj-gitgutter'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'glts/vim-textobj-comment'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/argtextobj.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
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
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'machakann/vim-highlightedyank'
Plug 'AndrewRadev/deleft.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()
