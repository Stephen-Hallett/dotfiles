"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureFiles = configureFiles;
const vscode = require("vscode");
function configureFiles(config) {
    config.update("files.autoSave", "afterDelay", vscode.ConfigurationTarget.Global);
    config.update("files.autoSaveDelay", 1000, vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=files.js.map