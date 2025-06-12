import * as vscode from "vscode";

export function configureFont(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
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
}
