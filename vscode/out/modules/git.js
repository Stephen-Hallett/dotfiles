"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureGit = configureGit;
function configureGit(config) {
    config.update("git.autofetch", true, true);
    config.update("git.enableSmartCommit", true, true);
}
//# sourceMappingURL=git.js.map