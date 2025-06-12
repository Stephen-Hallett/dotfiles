"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureExplorer = configureExplorer;
const vscode = require("vscode");
function configureExplorer(config) {
    config.update("explorer.confirmDragAndDrop", false, vscode.ConfigurationTarget.Global);
    config.update("explorer.confirmDelete", false, vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=explorer.js.map