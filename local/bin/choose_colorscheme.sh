#!/bin/bash
ALACRITTY_YAML="$HOME/dotfiles/alacritty.yml"
colorscheme=$(grep '&' $ALACRITTY_YAML | sed -e 's/^[ \t]*//' | cut -d ':' -f 1 | bemenu)
echo $colorscheme
if [ -z "$colorscheme" ]; then
    echo "Nothing chosen"
    exit 0
fi
echo "Choosing colorscheme: $colorscheme"
echo "grep '$colorscheme' $ALACRITTY_YAML"
tag=$(grep "$colorscheme" $ALACRITTY_YAML | sed -e 's/^[ \t]*//' | cut -d ':' -f 2 | cut -d '&' -f 2)
echo "using tag: $tag"
background=${tag//[[:digit:]]/}
sed -i -e "s/^colors: \*.*/colors: *$tag/" $ALACRITTY_YAML
if [[ $background == "light" || $background == "dark" ]]; then
    echo "Setting nvim background to: $background. Be sure to re-source to update!"
    sed -i -e "s/^set background=.*/set background=$background/" $HOME/dotfiles/config/nvim/init.vim
fi
