if command -v code >/dev/null 2>&1; then
    curl -fsSL https://github.com/Stephen-Hallett/dotfiles/releases/latest/download/vscode-config.vsix -o /tmp/vscode-config.vsix
    code --install-extension /tmp/vscode-config.vsix
fi