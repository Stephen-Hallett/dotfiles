"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureSecurity = configureSecurity;
const vscode = require("vscode");
function configureSecurity(config) {
    config.update("security.workspace.trust.untrustedFiles", "open", vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=security.js.map