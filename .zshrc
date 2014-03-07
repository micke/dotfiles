source $HOME/.zsh/completion
source $HOME/.zsh/keybindings
source $HOME/.zsh/functions
source $HOME/.zsh/aliases
source $HOME/.zsh_prompt

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# PATH
export PATH="/Applications/Postgres.app/Contents/Version/9.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
eval "$(rbenv init -)"
export PATH="./bin:$PATH"

# editor
export EDITOR=/usr/local/bin/vim

# cd
export CDPATH="$CDPATH:$HOME:$HOME/Projects"
setopt auto_cd

# Avoid issues in tmux
export LC_CTYPE="UTF-8"

# Disable flow control commands (keeps C-s from freezing everything)
stty stop undef
stty start undef
