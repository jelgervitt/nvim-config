return {
	"b0o/SchemaStore.nvim",
	lazy = true,
	config = function()
		local lspconfig = require("lspconfig")
		local schemas = require("schemastore").json.schemas()

		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = schemas,
					validate = { enable = true },
				},
			},
		})
	end,
}
