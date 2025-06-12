import * as vscode from "vscode";

export function configureBasedpyright(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  config.update("basedpyright.analysis.inlayHints.genericTypes", true, true);
  config.update("basedpyright.analysis.inlayHints.variableTypes", false, true);
  config.update(
    "basedpyright.analysis.inlayHints.callArgumentNames",
    false,
    true
  );
  config.update("basedpyright.disableOrganizeImports", true, true);
}
