import * as vscode from "vscode";

export function configureRuff(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  config.update(
    "ruff.configuration",
    "~/.config/ruff/ruff.toml",
    vscode.ConfigurationTarget.Global
  );
  config.update("ruff.nativeServer", "on", vscode.ConfigurationTarget.Global);
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
    "notebook.defaultFormatter",
    "charliermarsh.ruff",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "notebook.formatOnSave.enabled",
    true,
    vscode.ConfigurationTarget.Global
  );
}
