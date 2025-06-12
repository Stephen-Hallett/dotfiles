"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureHTML = configureHTML;
const vscode = require("vscode");
function configureHTML(config) {
    config.update("html.format.indentInnerHtml", true, vscode.ConfigurationTarget.Global);
    config.update("html.format.templating", true, vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=html.js.map