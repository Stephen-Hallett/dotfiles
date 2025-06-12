"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureBasedpyright = configureBasedpyright;
function configureBasedpyright(config) {
    config.update("basedpyright.analysis.inlayHints.genericTypes", true, true);
    config.update("basedpyright.analysis.inlayHints.variableTypes", false, true);
    config.update("basedpyright.analysis.inlayHints.callArgumentNames", false, true);
    config.update("basedpyright.disableOrganizeImports", true, true);
}
//# sourceMappingURL=basedPyright.js.map