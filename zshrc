# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

if [ "$(uname -m)" = "arm64" ]; then
  export BREW_PREFIX="/opt/homebrew"
else
  export BREW_PREFIX="/usr/local"
fi

# Go
export GOPATH=$HOME/code/micke/go

# PATH
export PATH="$BREW_PREFIX/bin:$BREW_PREFIX/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$BREW_PREFIX/share/npm/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/Qt5.5.0/5.5/clang_64/bin/:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$BREW_PREFIX/opt/mysql@5.6/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"

export WORDCHARS=""

# editor
export EDITOR=/opt/homebrew/bin/nvim

# shell
export SHELL=/opt/homebrew/bin/zsh

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
 --color=fg:#c4c8c6,bg:#1c1f20,gutter:#1c1f20,hl:#a5812d
 --color=fg+:#cccccc,bg+:#27292d,hl+:#f6c76b
 --color=info:#625a88,prompt:#6f7780,pointer:#dc595d
 --color=marker:#a9b75d,spinner:#ba8dba,header:#79c1b8'
# fzf vim half page up/down
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --bind="ctrl-u:half-page-up"
 --bind="ctrl-d:half-page-down"
 --bind="up:preview-up"
 --bind="down:preview-down"
'

# Homebrew config
export HOMEBREW_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1

# Fix OBJC error on mojave
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Enable history in erlang and elixir shell
export ERL_AFLAGS="-kernel shell_history enabled"

# asdf
source $BREW_PREFIX/opt/asdf/asdf.sh
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

# Use bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Enable buildkit for docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.zsh/completion
source $HOME/.zsh/keybindings
source $HOME/.zsh/functions
source $HOME/.zsh/aliases
source $HOME/.zsh_prompt
source $HOME/.secrets

source ~/.fzf.zsh

function gam() { "/Users/lisinge/bin/gam/gam" "$@" ; }
