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

# PATH
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
eval "$(rbenv init -)"
export PATH="./bin:$PATH"

# editor
export EDITOR=/usr/local/bin/vim

# cd
export CDPATH="$CDPATH:$HOME/code"
setopt auto_cd

# Go
export GOPATH=$HOME/.go

# Avoid issues in tmux
export LC_CTYPE="UTF-8"

# Fix java issue on yosemite
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_172)

# added by travis gem
[ -f /Users/lisinge/.travis/travis.sh ] && source /Users/lisinge/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
# source "/Users/lisinge/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
# source "/Users/lisinge/google-cloud-sdk/completion.zsh.inc"

# Load kubectl autocompletion
# source <(kubectl completion zsh)
