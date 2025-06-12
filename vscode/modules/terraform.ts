import * as vscode from "vscode";

export function configureTerraform(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  config.update(
    "[terraform]",
    {
      "editor.formatOnSave": true,
      "editor.defaultFormatter": "hashicorp.terraform",
      "editor.tabSize": 2,
    },
    vscode.ConfigurationTarget.Global
  );

  config.update(
    "[terraform-vars]",
    {
      "editor.formatOnSave": true,
      "editor.defaultFormatter": "hashicorp.terraform",
      "editor.tabSize": 2,
    },
    vscode.ConfigurationTarget.Global
  );
}
