import * as vscode from "vscode";

export function configureAutoDocstring(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  config.update(
    "autoDocstring.docstringFormat",
    "sphinx-notypes",
    vscode.ConfigurationTarget.Global
  );
}
