import { configureAutoDocstring } from "./autodocstring";
import { configureEditor } from "./editor";
import { configureExplorer } from "./explorer";
import { configureFiles } from "./files";
import { configureFont } from "./font";
import { configureHTML } from "./html";
import { configurePrettier } from "./prettier";
import { configureRuff } from "./ruff";
import { configureSecurity } from "./security";
import { configureTerminal } from "./terminal";
import { configureTerraform } from "./terraform";
import { configureCatppuccinMacchiato } from "./themes/catppuccin-macchiato";

export function configureModules(
  config: ReturnType<typeof import("vscode").workspace.getConfiguration>
) {
  configureAutoDocstring(config);
  configureEditor(config);
  configureExplorer(config);
  configureFiles(config);
  configureFont(config);
  configureHTML(config);
  configurePrettier(config);
  configureRuff(config);
  configureSecurity(config);
  configureTerminal(config);
  configureTerraform(config);
  configureCatppuccinMacchiato(config);
}
