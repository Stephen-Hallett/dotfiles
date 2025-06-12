"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureFont = configureFont;
const vscode = require("vscode");
function configureFont(config) {
    config.update("editor.fontFamily", "FantasqueSansM Nerd Font", vscode.ConfigurationTarget.Global);
    config.update("terminal.integrated.fontFamily", '"FantasqueSansM Nerd Font"', vscode.ConfigurationTarget.Global);
    config.update("editor.fontSize", 14, vscode.ConfigurationTarget.Global);
    config.update("terminal.integrated.fontSize", 14, vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=font.js.map