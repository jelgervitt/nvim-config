return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "lua_ls", "ts_ls", "html", "cssls" },
		automatic_installation = true,
	},
}
