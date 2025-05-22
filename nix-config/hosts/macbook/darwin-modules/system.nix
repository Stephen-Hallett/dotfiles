{ pkgs, config, ... }: {
  system = {
    defaults = {
      dock = {
        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Google Chrome.app"
          "/Applications/Spotify.app"
          "/Applications/Visual Studio Code.app"
          "/Applications/Discord.app"
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "/Applications/Postman.app"
          "/Applications/Infuse.app"
          "/Applications/Notability.app"
          "/System/Applications/App Store.app"
          "/System/Applications/System Settings.app"
        ];
      };
    };
  };
}
