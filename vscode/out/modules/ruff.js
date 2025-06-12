"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureRuff = configureRuff;
const vscode = require("vscode");
function configureRuff(config) {
    config.update("ruff.configuration", "~/.config/ruff/ruff.toml", vscode.ConfigurationTarget.Global);
    config.update("ruff.nativeServer", "on", vscode.ConfigurationTarget.Global);
    config.update("[python]", {
        "editor.formatOnSave": true,
        "editor.codeActionsOnSave": {
            "source.fixAll": "explicit",
            "source.organizeImports": "explicit",
        },
        "editor.defaultFormatter": "charliermarsh.ruff",
    }, vscode.ConfigurationTarget.Global);
    config.update("notebook.defaultFormatter", "charliermarsh.ruff", vscode.ConfigurationTarget.Global);
    config.update("notebook.formatOnSave.enabled", true, vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=ruff.js.map