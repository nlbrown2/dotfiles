source ~/.bashrc

# this doesn't really work, but is supposed to run gdb inside of docker
alias gdb="ln ~/dotfiles/Dockerfile .; ln ~/dotfiles/gdbinit; ln ~/dotfiles/hlgdb.py; docker build -t gdbdocker --build-arg CACHE_DATE=$(date) . > /dev/null; docker run -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --privileged gdbdocker"

# alias to source/reload profile
alias sprofile="source ~/.bash_profile"
