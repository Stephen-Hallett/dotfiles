import * as vscode from "vscode";

export function configureExplorer(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
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
}
