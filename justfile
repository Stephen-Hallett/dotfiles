repo_ssh := "git@github.com:Stephen-Hallett/dotfiles.git"
repo_http := "https://github.com/Stephen-Hallett/dotfiles.git"

vscode:
    @tsc --project {{env_var("HOME")}}/dotfiles/vscode/tsconfig.json
    @cd {{env_var("HOME")}}/dotfiles/vscode && vsce package --out {{env_var("HOME")}}/dotfiles/vscode/config.vsix
    @code --install-extension {{env_var("HOME")}}/dotfiles/vscode/config.vsix

build:
    #!/usr/bin/env bash
    if ! command -v nix &> /dev/null; then
        echo "Installing Nix..."
        curl -L https://nixos.org/nix/install | sh
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
