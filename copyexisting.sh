#!/bin/bash

dotfilesdir=$(pwd)
if [[ $(git diff) ]]
then
    echo "enter y or yes to continue"
    read confirm
    if [ $confirm != "y" ] && [ $confirm != "yes" ]
    then
        echo "aborting"
        exit 1
    fi
fi
files=$(ls)
echo $files
copied_files=()
for file in $files; do
    if [ -e $HOME/.$file ]
    then
        echo "copying $file"
        copied_files+=$file
        cp -r $HOME/.$file $dotfilesdir/$file
    fi
done
echo "copied files: $copied_files"
