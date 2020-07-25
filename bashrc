# fzf autocomplete
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# command prompt
source ~/.git-prompt.sh
PS1='\[\033[0;36m\]\w\[\033[0;32m\]$(__git_ps1)\033[0;32m\]\$ \[\033[0m\]'

# git autocomplete
source ~/.git-completion.bash

# when in a new terminal, virtual env is not active
unset VIRTUAL_ENV

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

#use lldb not from brew
#alias lldb="/usr/bin/lldb"

# useful substitutes
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"

# better ls
alias ls="exa"

# better cat
alias cat="bat"
export BAT_THEME="DarkNeon"

# support for f for typos
eval $(thefuck --alias)
alias f="fuck"

# vim w/ sessions
alias vims="nvim -S Session.vim"

# functions to sftp sync between local and CAEN using rsync
function downsync() {
  PWD=$(pwd)
  STEM="/Users/nlbrown222/Documents/"
  REMOTE_DIR="${PWD//${STEM}/""}"
  echo $REMOTE_DIR
  echo "rsync -avzuP --exclude=".git/" sftpcaen:$REMOTE_DIR/ $PWD"
  rsync -avzuP --exclude=".git/" sftpcaen:$REMOTE_DIR/ $PWD
}

function upsync() {
  PWD=$(pwd)
  STEM="/Users/nlbrown222/Documents/"
  REMOTE_DIR="${PWD//${STEM}/""}"
  echo $REMOTE_DIR
  echo "rsync -avzuP --exclude=".git/" $PWD/ sftpcaen:$REMOTE_DIR"
  rsync -avzuP --exclude=".git/" $PWD/ sftpcaen:$REMOTE_DIR
}

# get me tokens
source ~/.tokenrc
source /Users/nlbrown222/dotfiles/alacritty/extra/completions/alacritty.bash
