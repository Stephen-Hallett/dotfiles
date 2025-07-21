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

          general = {
            gaps_in = 2;
            gaps_out = 5;
            border_size = 3;
            # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            # "col.inactive_border" = "rgba(595959aa)";

            layout = "dwindle";

            resize_on_border = true;
          };

          decoration = {
            rounding = 5;

            blur = {
              enabled = true;
              size = 3;
              passes = 1;
              vibrancy = "0.1696";
              new_optimizations = true;
            };

            shadow = {
              enabled = false;
              range = 4;
              render_power = 3;
            };
          };

          animations = {
            enabled = true;

            bezier = [
              "wind, 0.05, 0.09, 0.1, 1.05"
              "winIn, 0.1, 1.1, 0.1, 1.1"
              "winOut, 0.3, -0.3, 0, 1"
              "liner, 1, 1, 1, 1"
            ];

            animation = [
              "windows, 1, 6, wind, slide"
              "windowsIn, 1, 6, winIn, slide"
              "windowsOut, 1, 5, winOut, slide"
              "windowsMove, 1, 5, wind, slide"
              "border, 1, 1, liner"
              "borderangle, 1, 30, liner, loop"
              "fade, 1, 10, default"
              "workspaces, 1, 5, wind"
            ];
          };

          dwindle = {
            pseudotile =
              true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = true; # you probably want this
          };

          master = { new_status = true; };

          misc = {
            animate_manual_resizes = true;
            animate_mouse_windowdragging = true;
            enable_swallow = true;
            render_ahead_of_time = false;
            disable_hyprland_logo = true;
          };

          bind = [
            # "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

            "$mainMod, T, exec, ghostty"
            "$mainMod, W, killactive,"
            "$mainMod, M, exit,"
            "$mainMod, E, exec, thunar"
            "$mainMod, V, togglefloating,"
            "$mainMod, F, fullscreen, 1"
            "$mainMod, Super_L, exec, rofi -show drun -no-levenshtein-sort -disable-history"
            "$mainMod, Super_R, exec, rofi -show drun -no-levenshtein-sort -disable-history"
            "$mainMod, P, pseudo, # dwindle"
            "$mainMod, S, togglesplit, # dwindle"
            "$mainMod, B, exec, firefox"
            "$mainMod, L, exec, hyprlock"

            ''$mainMod SHIFT, P, exec, grim -g "$(slurp)" - | swappy -f -''

            # Move focus with mainMod + arrow keys
            "$mainMod, left,  movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up,    movefocus, u"
            "$mainMod, down,  movefocus, d"

            # Moving windows
            "$mainMod SHIFT, left,  swapwindow, l"
            "$mainMod SHIFT, right, swapwindow, r"
            "$mainMod SHIFT, up,    swapwindow, u"
            "$mainMod SHIFT, down,  swapwindow, d"

            # Window resizing                     X  Y
            "$mainMod CTRL, left,  resizeactive, -30 0"
            "$mainMod CTRL, right, resizeactive,  30 0"
            "$mainMod CTRL, up,    resizeactive,  0 -30"
            "$mainMod CTRL, down,  resizeactive,  0  30"

            # Switch workspaces with mainMod + [0-9]
            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
            "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
            "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
            "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
            "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
            "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
            "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
            "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
            "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
            "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

            # Scroll through existing workspaces with mainMod + scroll
            "$mainMod, mouse_down, workspace, e+1"
            "$mainMod, mouse_up, workspace, e-1"

            # Keyboard backlight
            ", F5, exec, brightnessctl -d *::kbd_backlight set +33%"
            ", F6, exec, brightnessctl -d *::kbd_backlight set 33%-"

            # Volume and Media Control
            ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
            ", XF86AudioLowerVolume, exec, pamixer -d 5 "
            ", XF86AudioMute, exec, pamixer -t"
            ", XF86AudioMicMute, exec, pamixer --default-source -m"

            # Brightness control
            ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
            ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

            # # Waybar
            # "$mainMod, B, exec, pkill -SIGUSR1 waybar"
            # "$mainMod, W, exec, pkill -SIGUSR2 waybar"

            # # Disable all effects
            # "$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh "
          ];

          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];
        };
      };
    })

    (lib.mkIf (config.nix-packages.hyprland.enable
      && config.nix-packages.hyprland.monitor-setup == "double") {
        wayland.windowManager.hyprland = {
          settings.monitor = lib.mkForce [
            "DP-4,2560x1440@180,0x0,1,bitdepth,10"
            "HDMI-A-2,1920x1080@60,2560x0,1,bitdepth,10,transform,1"
          ];
        };
      })

  ];
}
