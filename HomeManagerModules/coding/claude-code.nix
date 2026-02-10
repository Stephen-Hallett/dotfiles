{ lib, config, pkgs-unstable, ... }: {
  options = {
    common-packages.claude-code.enable =
      lib.mkEnableOption "enable claude code";
  };

  config = lib.mkIf config.common-packages.claude-code.enable {
    programs.claude-code = {
      enable = true;
      package = pkgs-unstable.claude-code;
      settings = {
        permissions = {
          allow = [
            "Bash(npm run *)" # npm scripts (dev, build, test, etc.)
            "Bash(bun *)" # Bun commands
            "Bash(pnpm *)" # pnpm commands
            "Bash(yarn *)" # Yarn commands
            "Bash(npx *)" # npx commands
            "Bash(uv *)" # UV commands
            "Bash(python *)" # python commands
            "Bash(fastapi *)" # fastapi commands

            "Bash(docker *)" # Docker commands
            "Bash(podman *)" # Podman commands

            "Bash(git status)" # Check git status
            "Bash(git diff *)" # View diffs
            "Bash(git log *)" # View history
            "Bash(git commit *)" # Create commits

            # File operations - generally safe
            "Read(**)" # Read any file (helpful for exploration)
            "Edit(**)" # Edit files (can be overridden per-project)

            # Testing and linting
            "Bash(vitest *)" # Vitest test runner
            "Bash(jest *)" # Jest test runner
            "Bash(eslint *)" # ESLint
            "Bash(prettier *)" # Prettier
          ];

          deny = [
            # Protect sensitive files
            "Read(.env)" # Environment variables
            "Read(.env.*)" # Environment variants
            "Read(**/secrets/**)" # Secrets directories
            "Read(**/.ssh/**)" # SSH keys
            "Edit(.env)" # Don't edit env files

            # Dangerous operations
            "Bash(rm -rf *)" # Recursive delete
            "Bash(sudo *)" # Elevated permissions
            "Bash(git push --force *)" # Force push (can lose work)
            "Bash(git reset --hard *)" # Hard reset (can lose work)
          ];
        };

        # Default model for all sessions
        model = "claude-sonnet-4-5-20250929";

        # Environment variables available in all Claude Code sessions
        env = {
          NODE_ENV = "development";
          LOG_LEVEL = "debug";
        };

        # Sandbox configuration for bash commands
        # When enabled, provides additional safety for command execution
        sandbox = {
          enabled = false; # Set to true for additional safety in production
          # allowedCommands = ["npm" "git" "bun"];  # Whitelist specific commands
        };
      };

      # Skills are reusable instructions in markdown format
      skills = {
        # Example: API design skill
        api-design = ''
          ---
          name: api-design
          description: Design RESTful APIs following best practices
          ---

          When designing API endpoints:
          - Use RESTful resource naming (plural nouns)
          - Choose appropriate HTTP methods (GET, POST, PUT, PATCH, DELETE)
          - Return consistent error responses
          - Include proper status codes
          - Add request validation
          - Document with OpenAPI/Swagger
          - Consider rate limiting and authentication
        '';
      };

      # Hooks are shell scripts that run at specific lifecycle events
      # Each hook is a simple shell script (not the JSON config format)
      hooks = {
        # Auto-format files after editing
        PostToolUse = ''
          #!/usr/bin/env bash
          # This hook runs after Edit or Write tools
          # Extract file path and run prettier if it's a file
          jq -r '.tool_input.file_path // empty' | while read -r file; do
            if [[ -f "$file" ]]; then
              npx prettier --write "$file" 2>/dev/null || true
            fi
          done
        '';

        # Desktop notification when Claude needs attention
        Notification = ''
          #!/usr/bin/env bash
          # Send macOS notification
          osascript -e 'display notification "Claude Code needs your attention" with title "Claude Code" sound name "Glass"' 2>/dev/null || true
        '';

        # Log session start
        SessionStart = ''
          #!/usr/bin/env bash
          echo "[$(date)] Claude Code session started in $(pwd)" >> ~/.claude/session.log
        '';
      };
    };
  };
}
