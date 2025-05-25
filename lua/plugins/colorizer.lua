return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		require("colorizer").setup({
			filetypes = { "*", "!lazy" }, -- enable everywhere except LazyVim UI
			user_default_options = {
				names = false, -- don't highlight color names like "red"
			},
		})
	end,
}
