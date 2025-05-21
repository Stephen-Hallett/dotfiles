{ pkgs, lib, config, ... }: {
  options = { common-packages.tmux.enable = lib.mkEnableOption "enable tmux"; };

  config = lib.mkIf config.common-packages.tmux.enable {
    programs.tmux = {
      enable = true;
      sensibleOnTop = true;

      baseIndex = 1;
      escapeTime = 0;
      keyMode = "vi";
      mouse = true;
      shortcut = "Space";
      terminal = "tmux-256color";

      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        sensible
        better-mouse-mode
        yank
        {
          plugin = resurrect;
          extraConfig = ''
            # set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
          '';
        }
        {
          plugin = catppuccin;
          extraConfig = ''
            set -g @catppuccin_window_left_separator ""
            set -g @catppuccin_window_right_separator ""
            set -g @catppuccin_window_middle_separator " █"
            set -g @catppuccin_window_number_position "right"

            set -g @catppuccin_window_default_fill "number"
            set -g @catppuccin_window_default_text "#W"

            set -g @catppuccin_window_current_fill "number"
            set -g @catppuccin_window_current_text "#W"

            set -g @catppuccin_status_modules_right "session"
            set -g @catppuccin_status_left_separator  " "
            set -g @catppuccin_status_right_separator ""
            set -g @catppuccin_status_fill "icon"
            set -g @catppuccin_status_connect_separator "no"

            set -g @catppuccin_directory_text "#{b:pane_current_path}"
          '';
        }
      ];

      extraConfig = ''
        bind | split-window -h
        bind - split-window -v
        unbind '"'
        unbind %
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"

        set -g allow-passthrough on
        set -gu default-command
        set -g default-shell /bin/zsh
      '';
    };
  };
}
