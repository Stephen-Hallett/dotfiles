{ pkgs, ... }: {
  services = {
    jankyborders = {
      enable = false;
      package = pkgs.jankyborders;
      hidpi = true;
      active_color =
        "gradient(top_left=0xFFA6DA95,bottom_right=0xFF8BD5CA)"; # Catppuccin macchiato green/teal
      inactive_color =
        "gradient(top_left=0xFF91D7E3,bottom_right=0xFF7DC4E4)"; # Catppuccin macchiato teal
      width = 4.01;
      order = "above";
      blur_radius = 1.5;
      ax_focus = true
    };
  };
}
