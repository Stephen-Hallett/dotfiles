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
        hms =
          "home-manager switch --impure --flake ${flakeDir} && source ~/dotfiles/Brewfile.sh && exec zsh";
        drs =
          "sudo darwin-rebuild switch --flake ${flakeDir}#macbook && exec zsh";
        drs-work =
          "sudo darwin-rebuild switch --flake ${flakeDir}#work && exec zsh";
        rb = "sudo nixos-rebuild switch --impure --flake ${flakeDir}";

        ".." = "z ..";
        cat = "bat";
        pip = "pip3";
        python = "python3";
        ls =
          "eza --icons=always --color=always --long --no-filesize --no-time --no-user --group-directories-first";
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

        # Add linuxbrew to path
        if [[ "$HOST" == "SWAGGERMUFFIN" || "$HOST" == "HOSTNAME2" ]]; then
          eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
          export HOMEBREW_GIT_PATH=${pkgs.git}/bin/git
        fi

        unsetopt beep

        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

        zstyle ':completion:*' menu select

        zstyle -e ':completion:*:default' list-colors 'reply=("''${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:''${(s.:.)LS_COLORS}")'

        autoload -Uz is-at-least

        source ${pkgs.fzf-git-sh}/share/fzf-git-sh/fzf-git.sh

        function detect-clipboard() {
            emulate -L zsh

            if [[ "''${OSTYPE}" == darwin* ]] && (( ''${+commands[pbcopy]} )) && (( ''${+commands[pbpaste]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | pbcopy; }
                function clippaste() { pbpaste; }
            elif [[ "''${OSTYPE}" == (cygwin|msys)* ]]; then
                function clipcopy() { cat "''${1:-/dev/stdin}" > /dev/clipboard; }
                function clippaste() { cat /dev/clipboard; }
            elif (( $+commands[clip.exe] )) && (( $+commands[powershell.exe] )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | clip.exe; }
                function clippaste() { powershell.exe -noprofile -command Get-Clipboard; }
            elif [ -n "''${WAYLAND_DISPLAY:-}" ] && (( ''${+commands[wl-copy]} )) && (( ''${+commands[wl-paste]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | wl-copy &>/dev/null &|; }
                function clippaste() { wl-paste --no-newline; }
            elif [ -n "''${DISPLAY:-}" ] && (( ''${+commands[xsel]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | xsel --clipboard --input; }
                function clippaste() { xsel --clipboard --output; }
            elif [ -n "''${DISPLAY:-}" ] && (( ''${+commands[xclip]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | xclip -selection clipboard -in &>/dev/null &|; }
                function clippaste() { xclip -out -selection clipboard; }
            elif (( ''${+commands[lemonade]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | lemonade copy; }
                function clippaste() { lemonade paste; }
            elif (( ''${+commands[doitclient]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | doitclient wclip; }
                function clippaste() { doitclient wclip -r; }
            elif (( ''${+commands[win32yank]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | win32yank -i; }
                function clippaste() { win32yank -o; }
            elif [[ $OSTYPE == linux-android* ]] && (( $+commands[termux-clipboard-set] )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | termux-clipboard-set; }
                function clippaste() { termux-clipboard-get; }
            elif [ -n "''${TMUX:-}" ] && (( ''${+commands[tmux]} )); then
                function clipcopy() { tmux load-buffer "''${1:--}"; }
                function clippaste() { tmux save-buffer -; }
            else
                function _retry_clipboard_detection_or_fail() {
                    local clipcmd="''${1}"; shift
                    if detect-clipboard; then
                        "''${clipcmd}" "$@"
                    else
                        print "''${clipcmd}: Platform $OSTYPE not supported or xclip/xsel not installed" >&2
                        return 1
                    fi
                }
                function clipcopy() { _retry_clipboard_detection_or_fail clipcopy "$@"; }
                function clippaste() { _retry_clipboard_detection_or_fail clippaste "$@"; }
                return 1
            fi
        }

        function clipcopy clippaste {
            unfunction clipcopy clippaste
            detect-clipboard || true # let one retry
            "$0" "$@"
        }

        function copyfile {
            emulate -L zsh
            clipcopy $1
        }

        #Function to activate virtual environments
        activate() {
          source "$1"/bin/activate
        }

        zle-line-init() {
          emulate -L zsh

          [[ $CONTEXT == start ]] || return 0

          while true; do
            zle .recursive-edit
            local -i ret=$?
            [[ $ret == 0 && $KEYS == $'\4' ]] || break
            [[ -o ignore_eof ]] || exit 0
          done

          local saved_prompt=$PROMPT
          local saved_rprompt=$RPROMPT

          # Set prompt value from character module
          PROMPT="$(starship module -s ''${STARSHIP_CMD_STATUS:-0} character)"
          RPROMPT='''
          zle .reset-prompt
          PROMPT=$saved_prompt
          RPROMPT=$saved_rprompt

          if (( ret )); then
            zle .send-break
          else
            zle .accept-line
          fi
          return ret
        }

        zle -N zle-line-init
      '';
    };
  };
}
