return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			bg = "#282828",
			fg = "#ebdbb2",
			yellow = "#d79921",
			cyan = "#8ec07c",
			-- darkblue = "#458588",
			darkblue = "#7DAEA3",
			green = "#A8B665",
			orange = "#fe8019",
			violet = "#b16286",
			magenta = "#d3869b",
			blue = "#83a598",
			red = "#fb4934",
		}

		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = true,
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
			highlights = {
				fill = {
					bg = colors.bg,
				},
				background = {
					fg = colors.fg,
					bg = colors.bg,
				},
				buffer_selected = {
					fg = colors.fg,
					bg = colors.bg,
					bold = true,
				},
				separator = {
					fg = colors.bg,
					bg = colors.bg,
				},
				separator_selected = {
					fg = colors.bg,
					bg = colors.bg,
				},
				modified = {
					fg = colors.orange,
					bg = colors.bg,
				},
				modified_selected = {
					fg = colors.orange,
					bg = colors.bg,
				},
				diagnostic = {
					fg = colors.red,
				},
				diagnostic_selected = {
					fg = colors.red,
					bold = true,
				},
			},
		})
		vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
		vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
	end,
}
