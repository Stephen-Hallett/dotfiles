{ pkgs, lib, config, ... }: {
  options = { core-packages.zsh.enable = lib.mkEnableOption "enable zsh"; };

  config = lib.mkIf config.core-packages.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = let flakeDir = "~/dotfiles/nix-config";
      in {
        hms = "home-manager switch --impure --flake ${flakeDir} && exec zsh";
        drs =
          "sudo darwin-rebuild switch --flake ${flakeDir}#macbook && exec zsh";
        drs-work =
          "sudo darwin-rebuild switch --flake ${flakeDir}#work && exec zsh";
        rb = "sudo nixos-rebuild switch --impure --flake ${flakeDir}";

        ".." = "z ..";
        cat = "bat";
        pip = "pip3";
        python = "python3";
        ls = "eza --long --no-filesize --no-time";
        cd = "z";
      };
      history = {
        save = 1000;
        size = 1000;
        path = "${config.xdg.dataHome}/zsh/history";
        expireDuplicatesFirst = true;
        ignoreDups = true;
        ignoreSpace = true;
      };

      completionInit = ''
        autoload -Uz compinit && compinit
        autoload -Uz bashcompinit && bashcompinit
      '';

      initContent = ''
        zstyle :compinstall filename "$HOME/.zshrc"

        source ~/dotfiles/open_message.sh
        echo "\033[1;32m$message\033[0m"

        unsetopt beep

        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

        zstyle ':completion:*' menu select

        zstyle -e ':completion:*:default' list-colors 'reply=("''${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:''${(s.:.)LS_COLORS}")'

        autoload -Uz is-at-least

        source ${pkgs.fzf-git-sh}/share/fzf-git-sh/fzf-git.sh
      '';
    };
  };
}
