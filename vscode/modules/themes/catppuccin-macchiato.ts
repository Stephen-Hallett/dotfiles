import * as vscode from "vscode";

export function configureCatppuccinMacchiato(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
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
}
