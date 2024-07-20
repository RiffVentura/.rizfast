# .rizfast
Ricing at the speed of light


## Install stow
```bash
sudo apt install stow
```

## Usage

execute stow commands from this repo:
```bash
cd .rizfast
stow -t ~ nvim
stow -t ~ zsh
```
note: `-t` option specificies the target directory from which symlinks will be created. By default the target is the parent directory 