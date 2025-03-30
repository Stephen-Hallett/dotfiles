# Dotfiles config with Home-manager, Nix-Darwin & Homebrew

### To install (on Debian)

```sh
sudo apt-get install curl
sh <(curl -L https://nixos.org/nix/install) --daemon
# Accept all nix requests
echo -e '\nexperimental-features = nix-command flakes' | sudo tee -a /etc/nix/nix.conf
nix-shell -p home-manager git
# -- inside nix-shell --
git clone git@github.com:Stephen-Hallett/dotfiles.git # or https://github.com/Stephen-Hallett/dotfiles.git

home-manager switch --impure --flake ~/dotfiles/nix-config && exec zsh
exit
which zsh | sudo tee -a /etc/shells && chsh -s $(which zsh) && exec zsh # Set zsh as default shell
hms # Alias for home-manager switch which should exist after applying config
```

### Install with Just

First ensure you have installed curl & just, then run the following.

```sh
just -f <(curl -sL https://raw.githubusercontent.com/stephen-hallett/dotfiles/main/justfile)
```
