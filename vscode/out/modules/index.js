"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureModules = configureModules;
const autodocstring_1 = require("./autodocstring");
const editor_1 = require("./editor");
const explorer_1 = require("./explorer");
const files_1 = require("./files");
const font_1 = require("./font");
const html_1 = require("./html");
const prettier_1 = require("./prettier");
const ruff_1 = require("./ruff");
const security_1 = require("./security");
const terminal_1 = require("./terminal");
const terraform_1 = require("./terraform");
const catppuccin_macchiato_1 = require("./themes/catppuccin-macchiato");
function configureModules(config) {
    (0, autodocstring_1.configureAutoDocstring)(config);
    (0, editor_1.configureEditor)(config);
    (0, explorer_1.configureExplorer)(config);
    (0, files_1.configureFiles)(config);
    (0, font_1.configureFont)(config);
    (0, html_1.configureHTML)(config);
    (0, prettier_1.configurePrettier)(config);
    (0, ruff_1.configureRuff)(config);
    (0, security_1.configureSecurity)(config);
    (0, terminal_1.configureTerminal)(config);
    (0, terraform_1.configureTerraform)(config);
    (0, catppuccin_macchiato_1.configureCatppuccinMacchiato)(config);
}
//# sourceMappingURL=index.js.map