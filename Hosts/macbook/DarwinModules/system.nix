{ pkgs, pkgs-unstable, config, lib, ... }: {
  system = {
    defaults = {
      dock = {
        persistent-apps = [
          "/System/Applications/Apps.app"
          "/Applications/Google Chrome.app"
          "/Applications/Visual Studio Code.app"
          "${pkgs.vesktop}/Applications/Vesktop.app"
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "${config.programs.spicetify.spicedSpotify}/Applications/Spotify.app"
          "/Applications/Jagex Launcher.app"
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
