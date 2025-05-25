return {
	"praem90/nvim-phpcsf",
	config = function()
		require("phpcs").setup({
			phpcs = "phpcs",
			phpcbf = "phpcbf",
			standard = "WordPress",
		})

		-- format after save
		vim.api.nvim_create_augroup("PHBSCF", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = "PHBSCF",
			pattern = "*.php",
			callback = function()
				require("phpcs").cs()
			end,
		})

		vim.api.nvim_create_autocmd("BufWritePost", {
			group = "PHBSCF",
			pattern = "*.php",
			callback = function()
				require("phpcs").cbf()
			end,
		})
	end,
}
