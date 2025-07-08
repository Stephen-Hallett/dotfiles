import * as vscode from "vscode";

export function configureSecurity(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  config.update(
    "security.workspace.trust.untrustedFiles",
    "open",
    vscode.ConfigurationTarget.Global
  );
}
