{ pkgs, config, ... }: {
  system = {
    defaults = {
      dock = {
        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Visual Studio Code.app"
          "/Applications/Microsoft Teams.app"
          "/Applications/Microsoft Outlook.app"
          "/System/Applications/App Store.app"
          "/System/Applications/System Settings.app"
        ];
      };
    };
  };
}
