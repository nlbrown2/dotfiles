# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/nlbrown222/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# fzf autocomplete
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# command prompt
PS1='\[\033[0;36m\]\w\[\033[0;32m\]$(__git_ps1)\033[0;32m\]\$ \[\033[0m\]'
source ~/.git-prompt.sh

# git autocomplete
source ~/.git-completion.bash

# when in a new terminal, virtual env is not active
unset VIRTUAL_ENV

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

#use lldb not from brew
alias lldb="PATH=/usr/bin /usr/bin/lldb"

#add openssl to path
export PATH="/usr/local/opt/openssl/bin:$PATH"
# uncomment below lines to use openssl with c/c++
# export LDFLAGS=-L/usr/local/opt/openssl/lib
# export CPPFLAGS=-I/usr/local/opt/openssl/include

# useful substitutes
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"

# better ls
alias ls="exa"

# better cat
alias cat="bat"
export BAT_THEME="DarkNeon"

# support for f for typos
eval $(thefuck --alias)
alias f="fuck"

# vim w/ sessions
alias vims="vim -S Session.vim"

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

# java environment manager
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# latex support
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Users/nlbrown222/.vimpkg/bin

# RVM (ruby version manager)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# use powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

# get me tokens
source ~/.tokenrc
