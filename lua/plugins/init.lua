local plugin_specs = {}

-- Get list of plugin files
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local ui = { icons = vim.g.have_nerd_font and {} }

-- Use require instead of dofile to load plugin spec modules
for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
	if file:match(".*%.lua$") and file ~= "init.lua" and file ~= "lazy.lua" then
		local name = file:gsub("%.lua$", "")
		local plugin = require("plugins." .. name)
		if plugin then
			table.insert(plugin_specs, plugin)
		end
	end
end
require("lazy").setup(plugin_specs, ui)
