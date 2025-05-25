return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
			},
			messages = { enabled = true, view = "mini" },
			-- lsp = { progress = { enabled = false }, signature = { enabled = false } },
			presets = {
				bottom_search = true, -- classic cmdline at bottom
				command_palette = true, -- :Command and search UI
				long_message_to_split = true,
			},
		})
	end,
}
