return {
	"okuuva/auto-save.nvim",
	version = "*",
	cmd = "ASToggle",                        -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		debounce_delay = 5000,                 -- delay after which a pending save is executed
		noautocmd = true,
		condition = function(buf)
			return vim.bo[buf].modifiable and vim.bo[buf].buftype == "" or vim.bo.filetype ~= "php"
		end,
	},
}
