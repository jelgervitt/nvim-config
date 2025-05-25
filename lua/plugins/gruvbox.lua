return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	lazy = false,
	config = function()
		vim.g.gruvbox_material_background = "medium"
		vim.cmd("colorscheme gruvbox-material")
		-- selection color
		vim.api.nvim_set_hl(0, "Visual", { bg = "#A8B664", fg = "#000000" }) -- Replace with your preferred color
		vim.api.nvim_set_hl(0, "markdownCodeBlock", {
			fg = "#83a598",
			bold = false,
		})
	end,
}
