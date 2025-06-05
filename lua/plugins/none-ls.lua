return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"nvim-lua/plenary.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			debug = true,

			sources = {
				-- Formatters
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"json",
						"jsonc",
						"javascript",
						"javascriptreact",
						"typescriptreact",
						"typescript",
						"css",
						"html",
					},
					extra_args = { "--tab-width", "4" },
				}),
				-- Diagnostics
				require("none-ls.diagnostics.eslint").with({
					extra_args = { "--format", "json", "--no-color" },
				}),
				require("none-ls.code_actions.eslint"),
			},
		})

		-- Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				if vim.bo.filetype == "php" or vim.bo.filetype == "markdown" then
					return
				end
				vim.lsp.buf.format({
					async = false,
				})
			end,
		})
	end,
}
