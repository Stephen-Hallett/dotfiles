import * as vscode from "vscode";

export function configurePrettier(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  let prettierConfig = {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode",
  };
  for (let language of [
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "json",
  ]) {
    config.update(
      `[${language}]`,
      prettierConfig,
      vscode.ConfigurationTarget.Global
    );
  }
  config.update(
    "javascript.updateImportsOnFileMove.enabled",
    "always",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "typescript.updateImportsOnFileMove.enabled",
    "always",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "typescript.preferences.organizeImports",
    {
      enabled: true,
    },
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "javascript.preferences.organizeImports",
    {
      enabled: true,
    },
    vscode.ConfigurationTarget.Global
  );
}
