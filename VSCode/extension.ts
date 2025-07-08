import * as vscode from "vscode";
import { configureModules } from "./modules";

export function activate(context: vscode.ExtensionContext) {
  const config = vscode.workspace.getConfiguration();
  configureModules(config);
}

export function deactivate() {}
