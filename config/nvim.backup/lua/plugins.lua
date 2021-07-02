vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  use {"wbthomason/packer.nvim", opt = true}

  use {"sheerun/vim-polyglot"}

  use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}}
  use {"tpope/vim-unimpaired"}
  use {"tpope/vim-repeat"}
  use {"tpope/vim-surround"}
  use {"tpope/vim-bundler"}
  use {"tpope/vim-rails"}
  use {"tpope/vim-rake"}
  use {"tpope/vim-vinegar"}
  use {"tpope/vim-rhubarb"}
  use {"tpope/vim-projectionist"}
  use {"tpope/vim-abolish"}
  use {"tpope/vim-git"}
  use {"tpope/vim-rsi"}

  use {
    "andymass/vim-matchup",
    event = "VimEnter *",
    config = function()
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_delim_stopline = 1500
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_hi_surround_always = 1
    end
  }

  use {
    "w0rp/ale",
    ft = {"sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex"},
    cmd = "ALEEnable",
    config = "vim.cmd[[ALEEnable]]",
    setup = function()
      vim.o.updatetime = 100
      vim.o.signcolumn = "yes"

      vim.g.ale_disable_lsp = 1
      vim.g.ale_cache_executable_check_failures = 1
      vim.g.ale_virtualenv_dir_names = {}
      vim.g.ale_ruby_rubocop_executable = "bundle"
      vim.g.ale_fixers = {
        ["*"] = {"remove_trailing_lines", "trim_whitespace"},
        ruby = {"rubocop"},
        terraform = {"terraform"}
      }
      vim.g.ale_pattern_options = {
        [".*.ex$"] = {ale_enabled = 0},
        [".*.exs$"] = {ale_enabled = 0},
      }
    end
  }
  use {"plasticboy/vim-markdown"}
  use {"junegunn/vim-easy-align"}
  use {"junegunn/fzf", run = ":call fzf#install()"}
  use {"junegunn/fzf.vim"}
  use {"pgdouyon/vim-evanesco"}
  use {"wellle/targets.vim"}
  use {"christoomey/vim-tmux-navigator"}
  use {"tomtom/tlib_vim"}
  use {"kana/vim-textobj-user"}
  use {"kana/vim-textobj-entire"}
  use {"tek/vim-textobj-ruby"}
  use {"beloglazov/vim-textobj-quotes"}
  use {"glts/vim-textobj-comment"}
  use {"michaeljsmith/vim-indent-object"}
  use {"AndrewRadev/splitjoin.vim"}
  use {"AndrewRadev/dsf.vim"}
  use {"AndrewRadev/switch.vim"}
  use {"tweekmonster/fzf-filemru"}
  use {"stsewd/fzf-checkout.vim"}
  use {"sbdchd/neoformat"}
  use {"FooSoft/vim-argwrap"}
  use {"jiangmiao/auto-pairs"}
  use {"tpope/vim-endwise"}
  use {"tpope/vim-fugitive"}
  use {"janko-m/vim-test"}
  use {"mattn/webapi-vim"}
  use {"neoclide/coc.nvim", run = "yarn install --frozen-lockfile"}
  use {"AndrewRadev/deleft.vim"}
  use {"luochen1990/rainbow"}
  use {"rhysd/git-messenger.vim"}
  use {"ludovicchabant/vim-gutentags"}
  use {"itchyny/lightline.vim"}
  use {"cocopon/lightline-hybrid.vim"}
  use {"justinmk/vim-gtfo"}
  use {"airblade/vim-gitgutter"}
  use {"junegunn/vim-after-object"}
  use {"fatih/vim-go", run = ":GoUpdateBinaries"}
  use {"jasontbradshaw/pigeon.vim"}
  use {"tomtom/tcomment_vim"}
  use {"Yggdroot/indentLine"}

  use {"micke/vim-hybrid", setup = function()
    vim.g.hybrid_italic = 1
    vim.g.hybrid_italicize_strings = 0
  end}

  use {"sainnhe/edge", setup = function()
      vim.g.edge_style = "aura"
      vim.g.edge_enable_italic = 1
      vim.g.edge_disable_italic_comment = 1
  end}
end)
