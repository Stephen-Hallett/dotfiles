{ pkgs, config, ... }: {
  system = {
    defaults = {
      dock = {
        persistent-apps = [
          "/System/Applications/Apps.app"
          "/Applications/Firefox.app"
          "/Applications/Visual Studio Code.app"
          "/Applications/Microsoft Teams.app"
          "/Applications/Microsoft Outlook.app"
          "/Applications/Microsoft OneNote.app"
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "/Applications/Postman.app"
          "/System/Applications/App Store.app"
          "/System/Applications/System Settings.app"
        ];
      };
    };
  };
}
