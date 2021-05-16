if [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi

function command_exists() {
    command -v $1 > /dev/null;
}
# fzf autocomplete
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# command prompt right before the $\033[0;32m\]
#PS1='\[\033[0;36m\]\w\[\033[0;32m\]$(__git_ps1)\$ \[\033[0m\]'
[ -f  ~/.git-prompt.sh ] && source ~/.git-prompt.sh
OLD_PS1=$PS1
PS1='\[\033[01;31m\]\w' # coloful working directory
if type "__git_ps1" &> /dev/null; then
    gitPs1='\[\033[01;36m\]$(__git_ps1)\[\033[01;31m\]'
fi
partTwo='\\$ \[\033[00m\]' #really just $ and resetting text to white
PS1="$PS1$gitPs1$partTwo"
#PS1='\[\033[01;31m\]\w\[\033[01;36m\]$(__git_ps1)\[\033[01;31m\]\\$ \[\033[00m\]'

# git autocomplete
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash

# when in a new terminal, virtual env is not active
unset VIRTUAL_ENV

# useful substitutes
command_exists fzf && alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"

export PATH="/home/nathan/.cargo/bin:$PATH"
# better ls
command_exists exa && alias ls="exa"

# better cat
command_exists bat && alias cat="bat"
export BAT_THEME="DarkNeon"

# support for f for typos
command_exists thefuck && eval $(thefuck --alias)
command_exists fuck && alias f="fuck"

# vim w/ sessions
alias nvims="nvim -S Session.vim"

# functions to sftp sync between local and CAEN using rsync
function downsync() {
    PWD=$(pwd)
    STEM="/home/nathan/Documents/"
    REMOTE_DIR="${PWD//${STEM}/""}"
    echo $REMOTE_DIR
    echo "rsync -avzuP --exclude=".git/" sftpcaen:$REMOTE_DIR/ $PWD"
    rsync -avzuP --exclude=".git/" sftpcaen:$REMOTE_DIR/ $PWD
}

function upsync() {
    PWD=$(pwd)
    STEM="/home/nathan/Documents/"
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
function resetmouse() {
    echo "Resetting hid-magicmouse"
    sudo modprobe -r hid-magicmouse
    sudo modprobe hid-magicmouse
}

# get me tokens
[ -f ~/.tokenrc ] && source ~/.tokenrc


# Load colorscheme from wal/pywal. Can't use bat
#[ -f ~/.cache/wal/sequences ] && (/bin/cat ~/.cache/wal/sequences &)

alias sourcerc="source ~/.bashrc"

export PATH="$PATH:/home/nathan/.local/bin"

export EDITOR="nvim"

[ -f ~/.local/bin/init_directory ] && source ~/.local/bin/init_directory

# Run firefox in sandbox. See: https://wiki.gentoo.org/wiki/Simple_sandbox
# alias firefox='sudo -u ff firefox' && xhost si:localuser:ff
# enable setting the window title to a command when you run it. Doesn't update when the command exits, yet
# trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG
# myprompt() {
#     OLD_PS1=$PS1
#     echo -ne "\033]2; $(dirs +0) - $HOSTNAME\007"
#     PS1=$OLD_PS1
# }
# PROMPT_COMMAND=myprompt
# echo "here"
