# nix-mac:
# 	bash -c 'bash <(curl -L https://nixos.org/nix/install)'

home-manager: nix-linux
	echo 'experimental-features = nix-command flakes' | sudo tee -a /etc/nix/nix.conf
	nix-shell -p home-manager
	home-manager switch --impure --flake ./nix-config && source ~/dotfiles/Brewfile.sh && exec zsh

nix-linux:
	curl -L https://nixos.org/nix/install | sh -s -- --daemon