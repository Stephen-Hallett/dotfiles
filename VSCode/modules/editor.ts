import * as vscode from "vscode";

export function configureEditor(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  config.update(
    "editor.formatOnPaste",
    true,
    vscode.ConfigurationTarget.Global
  );
  config.update("editor.formatOnSave", true, vscode.ConfigurationTarget.Global);
}
