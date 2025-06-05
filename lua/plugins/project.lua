return {
	"coffebar/neovim-project",
	opts = {
		projects = { -- define project roots
			"/Users/Jelger/Library/Mobile Documents/iCloud~md~obsidian/Documents/Chunky Squirrel Obsidian/Chunky Squirrel",
			"/Users/Jelger/Library/Mobile Documents/iCloud~md~obsidian/Documents/Chunky Squirrel Obsidian/Chunky Squirrel/Clients/*",
			"~/.config/nvim",
			"/Users/Jelger/Library/Mobile Documents/iCloud~md~obsidian/Documents/Developer library/",
			"~/Coding/Learn JS/Udemy ultimate-react-course-main/the-wild-oasis/",
		},
		picker = {
			-- type = "telescope", -- or "fzf-lua"
			type = "telescope",
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		-- optional picker
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		-- optional picker
		-- { "ibhagwan/fzf-lua" },
		{ "Shatur/neovim-session-manager" },
	},
	keymaps = {
		vim.keymap.set("n", "<leader>op", "<cmd>NeovimProjectDiscover history<CR>", { desc = "[P]rojects overview" }),
		vim.keymap.set("n", "<leader>o.", "<cmd>NeovimProjectHistory<CR>", { desc = "[R]ecent projects" }),
		vim.keymap.set(
			"n",
			"<leader>oh",
			"<cmd>NeovimProjectLoad ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Chunky Squirrel Obsidian/Chunky Squirrel<CR>",
			{ desc = "Change to [H]ome Project" }
		),
	},
	lazy = false,
	priority = 100,
}
