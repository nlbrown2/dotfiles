source ~/.bashrc

alias gdb=lldb

# alias to source/reload profile
alias sprofile="source ~/.bash_profile"

export PATH="$HOME/.cargo/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true

