"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureAutoDocstring = configureAutoDocstring;
const vscode = require("vscode");
function configureAutoDocstring(config) {
    config.update("autoDocstring.docstringFormat", "sphinx-notypes", vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=autodocstring.js.map