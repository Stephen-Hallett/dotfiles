{ pkgs, lib, config, ... }: {
  options = {
    nix-config.headless.enable = lib.mkEnableOption "enable headless";
  };

  config = lib.mkIf config.nix-config.headless.enable {
    services.xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" "dummy" ];
      autorun = true;

      displayManager.startx.enable = true; # No GDM or desktop manager

      config = ''
        Section "Device"
            Identifier  "Configured Video Device"
            Driver      "dummy"
            VideoRam 256000
        EndSection

        Section "Monitor"
            Identifier  "Configured Monitor"
            HorizSync 5.0 - 1000.0
            VertRefresh 5.0 - 200.0
            ModeLine "1920x1080" 148.50 1920 2448 2492 2640 1080 1084 1089 1125 +Hsync +Vsync
        EndSection

        Section "Screen"
            Identifier  "Default Screen"
            Monitor     "Configured Monitor"
            Device      "Configured Video Device"
            DefaultDepth 24
            SubSection "Display"
            Depth 24
            Modes "1920x1080" "1280x800" "1024x768" "1920x1080" "1440x900"
            EndSubSection
        EndSection

      '';
    };

    # Needed for 32-bit games
    hardware.opengl.driSupport32Bit = true;
    hardware.opengl.enable = true;

  };
}
