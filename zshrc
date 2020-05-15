# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# Go
export GOPATH=$HOME/code/micke/go

# PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/Qt5.5.0/5.5/clang_64/bin/:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
eval "$(rbenv init -)"
export PATH="./bin:$PATH"

export WORDCHARS=""

# editor
export EDITOR=/usr/local/bin/nvim

# shell
export SHELL=/usr/local/bin/zsh

# cd
export CDPATH="$CDPATH:$HOME/code"
setopt auto_cd

# Avoid issues in tmux
export LC_CTYPE="UTF-8"

# Lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export FZF_DEFAULT_COMMAND='fd --type file --no-ignore-vcs --hidden --follow --exclude .git'
# fzf hybrid theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#c4c8c6,bg:#1c1f20,hl:#a5812d
 --color=fg+:#cccccc,bg+:#27292d,hl+:#f6c76b
 --color=info:#625a88,prompt:#6f7780,pointer:#dc595d
 --color=marker:#a9b75d,spinner:#ba8dba,header:#79c1b8'
# fzf vim half page up/down
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --bind="ctrl-u:half-page-up"
 --bind="ctrl-d:half-page-down"
'

# Homebrew config
export HOMEBREW_INSTALL_CLEANUP=true

# Fix OBJC error on mojave
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Enable history in erlang and elixir shell
export ERL_AFLAGS="-kernel shell_history enabled"

# Silence ruby 2.7 warnings
export RUBYOPT='-W0'

# Load kubectl autocompletion
# source <(kubectl completion zsh)

# Use bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.zsh/completion
source $HOME/.zsh/keybindings
source $HOME/.zsh/functions
source $HOME/.zsh/aliases
source $HOME/.zsh_prompt
source $HOME/.secrets

source ~/.fzf.zsh
