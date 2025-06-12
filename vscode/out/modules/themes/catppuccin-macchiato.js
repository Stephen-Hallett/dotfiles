"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureCatppuccinMacchiato = configureCatppuccinMacchiato;
const vscode = require("vscode");
function configureCatppuccinMacchiato(config) {
    config.update("workbench.colorTheme", "Catppuccin Macchiato", vscode.ConfigurationTarget.Global);
    config.update("workbench.iconTheme", "catppuccin-macchiato", vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=catppuccin-macchiato.js.map