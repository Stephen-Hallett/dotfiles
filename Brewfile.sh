if [[ "$HOST" == "SWAGGERMUFFIN" || "$HOST" == "HOSTNAME2" ]]; then
    export HOMEBREW_BUNDLE_FILE_GLOBAL="$HOME/dotfiles/Brewfile"
    brew bundle --global --file="$HOMEBREW_BUNDLE_FILE_GLOBAL"
    brew bundle cleanup --zap --force --quiet --file="$HOMEBREW_BUNDLE_FILE_GLOBAL"
fi
