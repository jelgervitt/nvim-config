return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	opts = {
		delete_to_trash = true,
		watch_for_changes = true,

		view_options = { show_hidden = true },
	},
	keymaps = {
		vim.keymap.set("n", "<leader>e", function()
			require("oil").toggle_float()
		end, { desc = "Open Oil" }),

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				-- Double Esc closes the Oil buffer
				vim.keymap.set("n", "<Esc><Esc>", "<Cmd>bd<CR>", { buffer = true, silent = true })
			end,
		}),
	},
}
