{ pkgs, config, ... }:
{
  system = {
    stateVersion = 5;
    configurationRevision = null;

    defaults = {
      dock = {
        autohide = true;
        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Firefox.app"
          "/Applications/Visual Studio Code.app"
          "/Applications/Microsoft Teams.app"
          "/Applications/Microsoft Outlook.app"
          "/Applications/Microsoft OneNote.app"
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "/Applications/Postman.app"
#          "/Applications/Notability.app"
          "/System/Applications/App Store.app"
          "/System/Applications/System Settings.app"
        ];
      };
      finder = {
        FXPreferredViewStyle = "clmv";
        _FXShowPosixPathInTitle = true;  # show full path in finder title
        AppleShowAllExtensions = true;  # show all file extensions
        FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
        QuitMenuItem = true;  # enable quit menu item
        ShowPathbar = true;  # show path bar
        ShowStatusBar = true;  # show status bar
      };
      trackpad = {
        Clicking = false;  # enable tap to click
        TrackpadRightClick = true;  # enable two finger right click
        TrackpadThreeFingerDrag = false;  # enable three finger drag
      };


      loginwindow.GuestEnabled = false;
      NSGlobalDomain = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        # `defaults read NSGlobalDomain "xxx"`
        "com.apple.swipescrolldirection" = false;  # enable natural scrolling(default to true)
        "com.apple.sound.beep.feedback" = 0;  # disable beep sound when pressing volume up/down key
        AppleKeyboardUIMode = 3;  # Mode 3 enables full keyboard control.
        ApplePressAndHoldEnabled = true;  # enable press and hold

        # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
        # This is very useful for vim users, they use `hjkl` to move cursor.
        # sets how long it takes before it starts repeating.
        InitialKeyRepeat = 15;  # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts. 
        KeyRepeat = 2;  # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = true;  
        NSAutomaticDashSubstitutionEnabled = true; 
        NSAutomaticPeriodSubstitutionEnabled = true;  
        NSAutomaticQuoteSubstitutionEnabled = true;  
        NSAutomaticSpellingCorrectionEnabled = true;  
        NSNavPanelExpandedStateForSaveMode = true; 
        NSNavPanelExpandedStateForSaveMode2 = true;
      };
      # Customize settings that not supported by nix-darwin directly
      # see the source code of this project to get more undocumented options:
      #    https://github.com/rgcr/m-cli
      # 
      # All custom entries can be found by running `defaults read` command.
      # or `defaults read xxx` to read a specific domain.
      CustomUserPreferences = {
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = true;
          ShowMountedServersOnDesktop = true;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.spaces" = {
          "spans-displays" = 0; # Display have seperate spaces
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 0; # Click wallpaper to reveal desktop
          StandardHideDesktopIcons = 0; # Show items on desktop
          HideDesktop = 0; # Do not hide items on desktop & stage manager
          StageManagerHideWidgets = 0;
          StandardHideWidgets = 0;
        };
      };
    };


    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      touch ~/.hushlogin
    '';

    activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
            '';

  };
}