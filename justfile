repo_ssh := "git@github.com:Stephen-Hallett/dotfiles.git"
repo_http := "https://github.com/Stephen-Hallett/dotfiles.git"

build:
    #!/usr/bin/env bash
    if ! command -v nix &> /dev/null; then
        echo "Installing Nix..."
        if [[ "$(uname -s)" == "Darwin" ]]; then
            curl -L https://nixos.org/nix/install | sh
        else
            curl -L https://nixos.org/nix/install | sh --daemon
        fi
    else
        echo "Nix is already installed."
    fi

    if [ -d "{{env_var("HOME")}}/dotfiles" ]; then
        echo "Dotfiles already cloned. Skipping..."
    else
        echo "Trying to clone dotfiles using SSH..."
        if git clone {{repo_ssh}} {{env_var("HOME")}}/dotfiles; then
            echo "Cloned dotfiles using SSH."
        else
            echo "SSH failed. Falling back to HTTPS..."
            git clone {{repo_http}} {{env_var("HOME")}}/dotfiles
        fi
    fi

    if command -v home-manager >/dev/null 2>&1; then
        echo "Updating home-manager config..."
        home-manager --extra-experimental-features "nix-command flakes" switch --impure --flake {{env_var('HOME')}}/dotfiles/nix-config
    else
        echo "Installing home-manager config..."
        nix-shell -p home-manager --run 'home-manager --extra-experimental-features "nix-command flakes" switch --impure --flake {{env_var("HOME")}}/dotfiles/nix-config'
    fi

    source {{env_var("HOME")}}/dotfiles/Brewfile.sh

    if [[ "$(uname -s)" == "Darwin" ]]; then
        if command -v darwin-rebuild >/dev/null 2>&1; then
            echo "Installing Nix Darwin"
            nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- switch
        fi
        echo "Installing nix darwin configuration"
        darwin-rebuild switch --flake {{env_var("HOME")}}/dotfiles/nix-config#macbook
    fi

    if command -v code >/dev/null 2>&1 && command -v tsc >/dev/null 2>&1 && command -v vsce >/dev/null 2>&1; then
        just --justfile {{justfile()}} vscode
    fi

vscode:
    echo "Updating VSCode configuration..."
    tsc --project {{env_var("HOME")}}/dotfiles/vscode/tsconfig.json
    cd {{env_var("HOME")}}/dotfiles/vscode && vsce package --out {{env_var("HOME")}}/dotfiles/vscode/config.vsix
    code --install-extension {{env_var("HOME")}}/dotfiles/vscode/config.vsix

