export PATH="/opt/homebrew/bin:/usr/local/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export HOMEBREW_BUNDLE_FILE_GLOBAL="$HOME/dotfiles/HomeManagerModules/terminal/homebrew/Brewfile"
brew bundle --global --file="$HOMEBREW_BUNDLE_FILE_GLOBAL"
