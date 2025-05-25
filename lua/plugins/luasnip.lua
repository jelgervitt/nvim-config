return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp", -- optional but recommended
	dependencies = { "rafamadriz/friendly-snippets" }, -- for a large snippet library

	config = function()
		require("luasnip").config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})

		require("luasnip.loaders.from_vscode").lazy_load() -- loads friendly-snippets
		local luasnip = require("luasnip")
		local snippet = luasnip.snippet
		local text = luasnip.text_node
		local snip_insert = luasnip.insert_node
		local snip_function = luasnip.function_node
		-- local filename = vim.fn.expand("%:t:r")

		luasnip.add_snippets("markdown", {
			snippet("link", {
				text("["),
				snip_insert(1, "link text"),
				text("]("),
				snip_insert(2, ""),
				text(")"),
			}),
		})

		luasnip.add_snippets("markdown", {
			snippet("ch", {
				text("- [ ] "),
			}),
		})

		luasnip.add_snippets("markdown", {
			snippet("start", {
				text("Start time: "),
				snip_function(function()
					return os.date("%H:%M")
				end, {}),
				text({ "", "End time: " }),
			}),
		})

		-- luasnip.add_snippets("javascriptreact", {
		-- 	snippet("rfc", {
		-- 		text("function "),
		-- 		snip_insert(1, filename),
		-- 		text({ "() {", "\treturn (" }),
		-- 		text({ "", "\t\t<div>" }),
		-- 		text({ "", "\t\t\t" }),
		-- 		snip_insert(0),
		-- 		text({ "", "\t\t</div>", "\t)", "}", "", "export default " }),
		-- 		snip_insert(1),
		-- 	}),
		-- })
	end,
}
