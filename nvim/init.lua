-- set up leader and local leader, and set vim options before loading plugins
require("vimOptions")

-- stuff for windows, wsl, etc
require("platformSpecifics")

require("autocmds")
require("keymaps")
require("filetypes")

require("lspAndDiagnostics")
