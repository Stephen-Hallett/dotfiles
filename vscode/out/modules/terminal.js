"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureTerminal = configureTerminal;
const vscode = require("vscode");
function configureTerminal(config) {
    config.update("terminal.explorerKind", "external", vscode.ConfigurationTarget.Global);
    config.update("terminal.integrated.profiles.osx", {
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
    }, vscode.ConfigurationTarget.Global);
    config.update("terminal.external.osxExec", "Alacritty.app", vscode.ConfigurationTarget.Global);
    config.update("terminal.integrated.defaultProfile.osx", "zsh", vscode.ConfigurationTarget.Global);
    config.update("terminal.integrated.enableMultiLinePasteWarning", "never", true);
}
//# sourceMappingURL=terminal.js.map