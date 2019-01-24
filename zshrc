source $HOME/.zsh/completion
source $HOME/.zsh/keybindings
source $HOME/.zsh/functions
source $HOME/.zsh/aliases
source $HOME/.zsh_prompt
source $HOME/.secrets

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
export PATH="./bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

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

# Homebrew config
export HOMEBREW_INSTALL_CLEANUP=true

# Fix OBJC error on mojave
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Enable history in erlang and elixir shell
export ERL_AFLAGS="-kernel shell_history enabled"

# added by travis gem
[ -f /Users/lisinge/.travis/travis.sh ] && source /Users/lisinge/.travis/travis.sh

# Load kubectl autocompletion
# source <(kubectl completion zsh)

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/opt/asdf/asdf.sh
source /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

eval "$(rbenv init -)"
