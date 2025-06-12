"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureEditor = configureEditor;
const vscode = require("vscode");
function configureEditor(config) {
    config.update("editor.formatOnPaste", true, vscode.ConfigurationTarget.Global);
    config.update("editor.formatOnSave", true, vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=editor.js.map