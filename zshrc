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
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
eval "$(rbenv init -)"
export PATH="./bin:$PATH"

# editor
export EDITOR=/usr/local/bin/vim

# cd
export CDPATH="$CDPATH:$HOME:$HOME/code"
setopt auto_cd

# Avoid issues in tmux
export LC_CTYPE="UTF-8"

# Fix java issue on yosemite
export JAVA_HOME=$(/usr/libexec/java_home)
