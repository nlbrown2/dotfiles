source ~/.bashrc

# this doesn't really work, but is supposed to run gdb inside of docker
alias gdb="ln ~/dotfiles/Dockerfile .; ln ~/dotfiles/gdbinit; ln ~/dotfiles/hlgdb.py; docker build -t gdbdocker --build-arg CACHE_DATE=$(date) . > /dev/null; docker run -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --privileged gdbdocker"

# alias to source/reload profile
alias sprofile="source ~/.bash_profile"

# used for hombrew and github 2fa
export HOMEBREW_GITHUB_API_TOKEN=ce18b606510b61048fd55f5e9b30c2942446f8a9
