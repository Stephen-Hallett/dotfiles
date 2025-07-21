{ lib, config, ... }: {
  options = {
    nix-packages.hyprland.enable = lib.mkEnableOption "enable hyprland";
    nix-packages.hyprland.monitor-setup = lib.mkOption {
      default = "single";
      type = with lib.types; nullOr (enum [ "single" "double" ]);
    };
    nix-packages.hyprland.mouse-sensitivity = lib.mkOption {
      default = "-0.5";
      type = with lib.types; nullOr (strMatching "-?[0-1].[0-9]+");
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.nix-packages.hyprland.enable {
      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        settings = let inherit (config.lib.stylix) colors;
        in {
          "$mainMod" = "SUPER";

          monitor = ",preferred,auto,1,bitdepth,10";

          env = [
            "XDG_CURRENT_DESKTOP,Hyprland"
            "XDG_SESSION_TYPE,wayland"
            "XDG_SESSION_DESKTOP,Hyprland"
            "XCURSOR_SIZE,12"
            "QT_QPA_PLATFORM,wayland"
            "XDG_SCREENSHOTS_DIR,~/screenshots"
            "GLFW_IM_MODULE,ibus"
          ];

          debug = {
            disable_logs = false;
            enable_stdout_logs = true;
          };

          input = {
            kb_layout = "us";
            kb_variant = "";
            kb_options = "grp:alt_space_toggle";

            follow_mouse = 1;

            touchpad = { natural_scroll = false; };

            accel_profile = "flat";
            sensitivity =
              config.nix-packages.hyprland.mouse-sensitivity; # -1.0 - 1.0, 0 means no modification.
          };

          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];
        };
      };
    })
  ];
}
