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
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$BREW_PREFIX/opt/rustup/bin:$PATH"
export PATH="/usr/local/bin:$BREW_PREFIX/bin:$BREW_PREFIX/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$BREW_PREFIX/share/npm/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/Qt5.5.0/5.5/clang_64/bin/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$BREW_PREFIX/opt/mysql@5.6/bin:$PATH"
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

setopt ignore_eof

# Avoid issues in tmux
export LC_CTYPE="UTF-8"

# Lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export FZF_DEFAULT_COMMAND='fd --type file --no-ignore-vcs --hidden --follow --exclude .git'

# fzf catppuccin theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

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

# Enable history in erlang and elixir shell
export ERL_AFLAGS="-kernel shell_history enabled"

# Enable buildkit for docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

export SOPS_AGE_KEY_FILE=$HOME/.config/sops/age/keys.txt

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.zsh/completion
source $HOME/.zsh/keybindings
source $HOME/.zsh/functions
source $HOME/.zsh/aliases
source $HOME/.zsh_prompt
source $HOME/.secrets

source <(fzf --zsh)

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# bun completions
[ -s "/Users/lisinge/.bun/_bun" ] && source "/Users/lisinge/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# mise
eval "$($BREW_PREFIX/bin/mise activate zsh)"
