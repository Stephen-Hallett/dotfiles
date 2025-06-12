import * as vscode from "vscode";

export function configureHTML(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
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
}
