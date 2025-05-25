-- Set leader key (before lazy setup)
vim.g.mapleader = " "

require("options.settings")
require("plugins.lazy")
require("plugins")
require("options.key-mappings")
