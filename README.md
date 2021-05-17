After cloning, run `makesymlinks.sh` to symlink all of the items in this directory to $HOME. If any files will be overwritten, they will be placed in $HOME/dotfiles_old JIK you need them.

Setup on new machine (MacOS).

# Neovim
In `config/nvim`, there is a script called `installer.sh` to install dein, the package manager. Set the path to be `~/.cache/nvim`, and be sure to update the config paths accordingly. Maybe sone of these days I'll write a shell wrapper script, but that's a TODO

You'll also want to setup a python3 venv, or virtual environment. This can be done easily with `python3 -m venv venv` also within the `~/.config/nvim` directory.

# Fonts
This typically uses Jet Brains Mono, as that is required by simple-bar. Download it, and install with Font Book. Be sure to update iTerm2 preferences so the fonts are showed correctly.

# Yabai
Makes MacOS feel more like a tiling WM. Shortcuts are setup via skhd / skhdrc. `brew services start yabai skhd` should be enough to set it up. If running on Big Sur, run `./yabairc` to setup yabai's extra features. May require disabling SIP, see yabai's documentation for more details.
