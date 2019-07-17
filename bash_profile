source ~/.bashrc

# alias to source/reload profile
alias sprofile="source ~/.bash_profile"

export M="/Users/nathanbrown/mongodb/mongo/"

# flags for scons
# 32 jobs, quiet, run config less often
export SCONSFLAGS="-j32 -Q MONGO_VERSION="0.0.0" MONGO_GIT_HASH="unknown""

alias scon="source ~/mongodb/mongo/python3-venv/bin/activate && python ~/mongodb/mongo/buildscripts/scons.py"
export PATH="$PATH:~/.local/bin"
