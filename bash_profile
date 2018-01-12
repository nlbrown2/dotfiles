PS1='\[\033[0;36m\]\w\[\033[0;32m\]$(__git_ps1)\033[0;32m\]\$ \[\033[0m\]'
source ~/.git-completion.bash
source ~/.git-prompt.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Users/nlbrown222/.vimpkg/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
unset VIRTUAL_ENV
# export PYTHONPATH=$PYTHONPATH:"/usr/local/lib/python2.7/site-packages/"
export PATH="/usr/local/opt/qt/bin:$PATH"
