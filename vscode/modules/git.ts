import * as vscode from "vscode";

export function configureGit(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  config.update("git.autofetch", true, true);
  config.update("git.enableSmartCommit", true, true);
}
