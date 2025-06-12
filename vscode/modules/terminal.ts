import * as vscode from "vscode";

export function configureTerminal(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  config.update(
    "terminal.explorerKind",
    "external",
    vscode.ConfigurationTarget.Global
  );

  config.update(
    "terminal.integrated.profiles.osx",
    {
      zsh: {
        path: "zsh",
        args: ["-l"],
      },
      tmux: {
        path: "tmux",
        icon: "terminal-tmux",
      },
      bash: {
        path: "bash",
        args: ["-l"],
        icon: "terminal-bash",
      },
    },
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "terminal.external.osxExec",
    "Alacritty.app",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "terminal.integrated.defaultProfile.osx",
    "zsh",
    vscode.ConfigurationTarget.Global
  );
  config.update(
    "terminal.integrated.enableMultiLinePasteWarning",
    "never",
    true
  );
}
