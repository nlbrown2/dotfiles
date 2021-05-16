#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_profile profile tmux.conf bashrc config/nvim git-completion.bash git-prompt.sh config/rofi config/kitty  config/sway config/swaylock config/kanshi config/mako local/bin cache/wal alacritty.yml config/waybar"


############################
#create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
#change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "..done"
#move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
	echo "mv ~/.$file ~/dotfiles_old/"
	    mv ~/.$file ~/dotfiles_old/
	        echo "ln -s $dir/$file ~/.$file"
	            ln -s $dir/$file ~/.$file
	    done

[ ! -f /usr/share/applications/custom-firefox.desktop ] && sudo ln -s $dir/custom-firefox.desktop $HOME/.local/share/applications/firefox.desktop
