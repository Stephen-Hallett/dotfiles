# Dotfiles config with Home-manager, Nix-Darwin & Homebrew

### Install with Just

> [!IMPORTANT]
> Ensure you have installed curl, git & just, then run the following command.

```sh
just -f <(curl -sL https://raw.githubusercontent.com/stephen-hallett/dotfiles/main/justfile)
```

### Manual install

```sh
sudo apt-get install curl
sh <(curl -L https://nixos.org/nix/install) --daemon
# Accept all nix requests
nix-shell -p home-manager git
# -- inside nix-shell --
git clone git@github.com:Stephen-Hallett/dotfiles.git # or https://github.com/Stephen-Hallett/dotfiles.git

home-manager switch --impure --extra-experimental-features "nix-command flakes" --flake ~/dotfiles && exec zsh
exit
which zsh | sudo tee -a /etc/shells && chsh -s $(which zsh) && exec zsh # Set zsh as default shell
hms # Alias for home-manager switch which should exist after applying config
```
