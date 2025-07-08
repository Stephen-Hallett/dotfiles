import * as vscode from "vscode";

export function configureFiles(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  config.update(
    "files.autoSave",
    "afterDelay",
    vscode.ConfigurationTarget.Global
  );
  config.update("files.autoSaveDelay", 1000, vscode.ConfigurationTarget.Global);
}
