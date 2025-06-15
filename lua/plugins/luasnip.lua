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
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		-- local filename = vim.fn.expand("%:t:r")

		local markdown_snippets = {
			s("checkbox", {
				t("- [ ] "),
				i(1),
			}),

			s("link", {
				t("["),
				i(1, "link to"),
				t("]("),
				i(2, ""),
				t(")"),
			}),

			s("start", {
				t("Start time: "),
				f(function()
					return os.date("%H:%M")
				end, {}),
				t({ "", "End time: " }),
			}),
		}

		local javascript_snippets = {
			s("arrow_function", {
				t("("),
				i(1),
				t(") => { "),
				i(2),
				t(" }"),
			}),
		}

		local javascriptreact_snippets = {
			s("arrow_function", {
				t("("),
				i(1),
				t(") => { "),
				i(2),
				t(" }"),
			}),
		}

		ls.add_snippets("markdown", markdown_snippets)
		ls.add_snippets("javascript", javascript_snippets)
		ls.add_snippets("javascriptreact", javascriptreact_snippets)
	end,
}
