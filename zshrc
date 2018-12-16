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
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="./bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# editor
export EDITOR=/usr/local/bin/nvim

# cd
export CDPATH="$CDPATH:$HOME/code"
setopt auto_cd

# Avoid issues in tmux
export LC_CTYPE="UTF-8"

# Lang
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Fix OBJC error on mojave
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Enable history in erlang and elixir shell
export ERL_AFLAGS="-kernel shell_history enabled"

# added by travis gem
[ -f /Users/lisinge/.travis/travis.sh ] && source /Users/lisinge/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
# source "/Users/lisinge/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
# source "/Users/lisinge/google-cloud-sdk/completion.zsh.inc"

# Load kubectl autocompletion
# source <(kubectl completion zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/opt/asdf/asdf.sh
source /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

eval "$(rbenv init -)"
