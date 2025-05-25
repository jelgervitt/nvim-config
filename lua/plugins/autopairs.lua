return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	-- use opts = {} for passing setup options
	init = function()
		local np = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		np.add_rules({
			Rule("*", "*", { "markdown" }):with_pair(cond.not_before_regex("\n")),
			Rule("_", "_", { "markdown" }):with_pair(cond.before_regex("%s")),
		})
	end,
}
