if [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
# fzf autocomplete
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# command prompt right before the $\033[0;32m\]
#PS1='\[\033[0;36m\]\w\[\033[0;32m\]$(__git_ps1)\$ \[\033[0m\]'
[ -f  ~/.git-prompt.sh ] && source ~/.git-prompt.sh
PS1='\[\033[01;31m\]\w\[\033[01;36m\]$(__git_ps1)\[\033[01;31m\]\\$ \[\033[00m\]'

# git autocomplete
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash

# when in a new terminal, virtual env is not active
unset VIRTUAL_ENV

# useful substitutes
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"

export PATH="/home/nathan/.cargo/bin:$PATH"
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

function resetwifi() {
    DRIVER=$(lshw -C network 2>&1 | grep wireless | grep driver | sed 's/ /\n/g' | grep driver= | tail -c +8)
    echo "Resetting driver: $DRIVER"
    sudo modprobe -r $DRIVER;
    sudo modprobe $DRIVER
}

# java environment manager
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

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
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /home/nathan/.local/lib/python4.6/site-packages/powerline/bindings/bash/powerline.sh

# get me tokens
[ -f ~/.tokenrc ] && source ~/.tokenrc

# add bot-lcm-tunnel to PATH
export PATH="$PATH:$HOME/Documents/eecs467/libbot2/build/bin"
export VX_SHADER_PATH=/home/nathan/Documents/eecs467/labs/a1_code/mobilebot-f19/botgui/vx/shaders
export VX_FONT_PATH=/home/nathan/Documents/eecs467/labs/a1_code/mobilebot-f19/botgui/vx/fonts
export CLASSPATH=:~/commons-io-2.6.jar 

#add bolt binaries to PATH
export PATH="$PATH:/home/nathan/Documents/research/build/bin"

#add CCLS to PATH
export PATH="$PATH:/home/nathan/ccls/Release"

# Load colorscheme from wal/pywal. Can't use bat
(/bin/cat ~/.cache/wal/sequences &)

alias sourcerc="source ~/.bashrc"
[ -f ~/ros_catkin_ws/devel/setup.bash ] && source ~/ros_catkin_ws/devel/setup.bash
export PATH="$PATH:/home/nathan/Documents/research/pmu-tools/"
export PATH="$PATH:/home/nathan/Documents/KTPuild/"
export PATH="$PATH:/home/nathan/.local/bin"

# compiler flags for BOLT
export LDFLAGS="-Wl,-q"
[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash
export EDITOR="nvim"
export TERMINAL="kitty"
[ -f ~/.local/bin/init_directory ] && source ~/.local/bin/init_directory
