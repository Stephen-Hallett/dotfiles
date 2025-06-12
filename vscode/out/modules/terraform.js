"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureTerraform = configureTerraform;
const vscode = require("vscode");
function configureTerraform(config) {
    config.update("[terraform]", {
        "editor.formatOnSave": true,
        "editor.defaultFormatter": "hashicorp.terraform",
        "editor.tabSize": 2,
    }, vscode.ConfigurationTarget.Global);
    config.update("[terraform-vars]", {
        "editor.formatOnSave": true,
        "editor.defaultFormatter": "hashicorp.terraform",
        "editor.tabSize": 2,
    }, vscode.ConfigurationTarget.Global);
}
//# sourceMappingURL=terraform.js.map