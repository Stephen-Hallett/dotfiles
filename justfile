vscode:
    echo "Updating VSCode configuration..."
    cd {{env_var("HOME")}}/dotfiles/vscode && npm install
    tsc --project {{env_var("HOME")}}/dotfiles/vscode/tsconfig.json
    cd {{env_var("HOME")}}/dotfiles/vscode && vsce package --out {{env_var("HOME")}}/dotfiles/vscode/config.vsix
    code --install-extension {{env_var("HOME")}}/dotfiles/vscode/config.vsix

