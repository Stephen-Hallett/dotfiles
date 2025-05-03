import * as vscode from "vscode";

export function activate(context: vscode.ExtensionContext) {
  const config = vscode.workspace.getConfiguration();

  // Language specific settings
  config.update(
    "[python]",
    {
      "editor.formatOnSave": true,
      "editor.codeActionsOnSave": {
        "source.fixAll": "explicit",
        "source.organizeImports": "explicit",
      },
      "editor.defaultFormatter": "charliermarsh.ruff",
    },
    vscode.ConfigurationTarget.Global
  );

  config.update(
    "[nix]",
    {
      "editor.defaultFormatter": "jnoortheen.nix-ide",
    },
    vscode.ConfigurationTarget.Global
  );

  config.update(
    "[terraform]",
    {
      "editor.formatOnSave": true,
      "editor.defaultFormatter": "hashicorp.terraform",
      "editor.tabSize": 2,
    },
    vscode.ConfigurationTarget.Global
  );

  config.update(
    "[terraform-vars]",
    {
      "editor.tabSize": 2,
    },
    vscode.ConfigurationTarget.Global
  );

  let prettierConfig = {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode",
  };
  for (let language of [
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "json",
  ]) {
    config.update(
      `[${language}]`,
      prettierConfig,
      vscode.ConfigurationTarget.Global
    );
  }

  config.update(
    "html.format.indentInnerHtml",
    true,
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "html.format.templating",
    true,
    vscode.ConfigurationTarget.Global
  );

  // Terminal Config
  config.update(
    "terminal.integrated.profiles.osx",
    {
      zsh: {
        path: "zsh",
        args: ["-l"],
      },
      tmux: {
        path: "tmux",
        icon: "terminal-tmux",
      },
      bash: {
        path: "bash",
        args: ["-l"],
        icon: "terminal-bash",
      },
    },
    vscode.ConfigurationTarget.Global
  );

  // Set fonts
  config.update(
    "editor.fontFamily",
    "FantasqueSansM Nerd Font",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "terminal.integrated.fontFamily",
    '"FantasqueSansM Nerd Font"',
    vscode.ConfigurationTarget.Global
  );
  config.update("editor.fontSize", 14, vscode.ConfigurationTarget.Global);
  config.update(
    "terminal.integrated.fontSize",
    14,
    vscode.ConfigurationTarget.Global
  );

  // Set theme
  config.update(
    "workbench.colorTheme",
    "Catppuccin Macchiato",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "workbench.iconTheme",
    "catppuccin-macchiato",
    vscode.ConfigurationTarget.Global
  );

  //terminal config
  config.update(
    "terminal.external.osxExec",
    "Alacritty.app",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "terminal.integrated.defaultProfile.osx",
    "zsh",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "terminal.explorerKind",
    "external",
    vscode.ConfigurationTarget.Global
  );

  // VSCode UI settings
  config.update(
    "explorer.confirmDragAndDrop",
    false,
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "explorer.confirmDelete",
    false,
    vscode.ConfigurationTarget.Global
  );
  config.update("window.zoomLevel", -1, vscode.ConfigurationTarget.Global);
  config.update(
    "security.workspace.trust.untrustedFiles",
    "open",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "window.confirmSaveUntitledWorkspace",
    false,
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "files.autoSave",
    "afterDelay",
    vscode.ConfigurationTarget.Global
  );
  config.update("files.autoSaveDelay", 1000, vscode.ConfigurationTarget.Global);

  // Development settings
  config.update(
    "autoDocstring.docstringFormat",
    "sphinx-notypes",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "notebook.formatOnSave.enabled",
    true,
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "notebook.defaultFormatter",
    "charliermarsh.ruff",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "ruff.configuration",
    "~/.config/ruff/ruff.toml",
    vscode.ConfigurationTarget.Global
  );
  config.update("ruff.nativeServe", "on", vscode.ConfigurationTarget.Global);
  config.update(
    "diffEditor.ignoreTrimWhitespace",
    false,
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "editor.formatOnPaste",
    true,
    vscode.ConfigurationTarget.Global
  );
  config.update("editor.formatOnSave", true, vscode.ConfigurationTarget.Global);
}

export function deactivate() {}
