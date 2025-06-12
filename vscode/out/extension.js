"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = activate;
exports.deactivate = deactivate;
const vscode = require("vscode");
const modules_1 = require("./modules");
function activate(context) {
    const config = vscode.workspace.getConfiguration();
    (0, modules_1.configureModules)(config);
}
function deactivate() { }
//# sourceMappingURL=extension.js.map