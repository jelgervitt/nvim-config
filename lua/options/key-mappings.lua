local map = vim.keymap.set

-- [[ Basic Keymaps ]]
--  See `:help map()`

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- [[ Basic Keymaps ]]
--  See `:help map()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- visual line navigation instead of logical lines
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "0", "g0")
map("n", "$", "g$")
map("i", "<D-b>", "**", { desc = "Bold text" })

-- buffer and window mappings
local wk = require("which-key")
local notes = require("custom.work-notes")
local snacks = require("snacks")
wk.add({
	-- Diagnostic keymaps
	{ "<leader>q", group = "Diagnostics" },
	{ "<leader>ql", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix [L]ist" } },
	{ "<leader>qf", vim.diagnostic.open_float, { desc = "Open diagnostic in [F]loat" } },

	-- buffers
	{ "<leader>b", group = "[B]uffer" },
	{
		"<leader>bb",
		function()
			Snacks.picker.buffers()
		end,
		desc = "List buffers",
	},
	{
		"<leader>bd",
		function()
			snacks.bufdelete()
		end,
		desc = "[D]elete buffer, keep window layout",
	},
	{
		"<leader>bD",
		function()
			snacks.bufdelete.all()
		end,
		desc = "[D]elete all buffers, keep window layout",
	},
	{
		"<leader>bo",
		function()
			snacks.bufdelete.other()
		end,
		desc = "[D]elete other buffers, keep window layout",
	},
	{ "<leader>bx", "<cmd>bdelete<cr>", desc = "Delete buffer" },
	{ "<leader>bX", "<cmd>%bd|e#|bd#<cr>", desc = "Close other buffers" },
	{ "<leader>bl", "<cmd>edit #<cr>", desc = "Last buffer" },
	{ "<leader>bn", "<cmd>enew<CR>", desc = "New buffer" },
	{ "<leader>bt", "<cmd>bnext<cr>", desc = "Next buffer" },

	-- windows
	{ "<leader>w", name = "Window" },
	{ "<leader>w=", "<C-w>=", desc = "Balance windows" },
	{ "<leader>wh", "<C-w>h", desc = "Left" },
	{ "<leader>wj", "<C-w>j", desc = "Down" },
	{ "<leader>wk", "<C-w>k", desc = "Up" },
	{ "<leader>wl", "<C-w>l", desc = "Right" },
	{ "<leader>ws", "<cmd>split<cr>", desc = "Split Horizontally" },
	{ "<leader>wv", "<cmd>vsplit<cr>", desc = "Split Vertically" },
	{ "<leader>wx", "<cmd>close<cr>", desc = "Close" },

	-- Mappings for projects
	{ "<leader>o", name = "Pr[o]ject shortcuts" },
	{ "<leader>oo", "<cmd>Obsidian follow_link vsplit<CR>", desc = "[O]pen in new tab" },
	{ "<leader>ow", notes.create_work_note, desc = "Create [w]ork note" },
	{ "<leader>om", notes.create_meeting_note, desc = "Create [m]eeting note" },
	{ "<leader>oc", notes.create_moc_note, desc = "Create map of [c]ontent" },
	{ "<leader>os", notes.create_support_doc, desc = "Create [s]upport document" },
	{ "<leader>ot", notes.insert_time, desc = "Insert [t]ime" },
	{ "<leader>od", notes.insert_date, desc = "Insert [d]ate" },

	-- Tabs
	{ "<leader><Tab>", name = "Tabs" },
	{ "<leader><Tab><Tab>", "<cmd>tabnew<CR>", desc = "New [Tab]" },
	{ "<leader><Tab>c", "<cmd>tabclose<CR>", desc = "[C]lose Tab" },
	{ "<leader><Tab>l", "<cmd>tabs<CR>", desc = "[L]ist Tabs" },
	{ "<leader><Tab>s", "<cmd>tab split<CR>", desc = "[S]plit current buffer to new tab" },

	-- Lazygit
	{
		"<leader>l",
		function()
			snacks.lazygit.open()
		end,
		desc = "Open [L]azyGit",
	},

	-- Copilot Chat

	{ "<leader>c", name = "Code + Copilot" },
	{ "<leader>co", "<cmd>CopilotChatOpen<CR>", desc = "Copilot Chat [O]pen" },
	{ "<leader>cq", "<cmd>CopilotChatClose<CR>", desc = "Copilot Chat [C]lose" },
	{ "<leader>ct", "<cmd>CopilotChatToggle<CR>", desc = "Copilot Chat [T]oggle" },
	{ "<leader>cs", "<cmd>CopilotChatStop<CR>", desc = "Copilot Chat [S]top" },
	{ "<leader>cr", "<cmd>CopilotChatReset<CR>", desc = "Copilot Chat [R]eset" },
	{ "<leader>cp", "<cmd>CopilotChatPrompts<CR>", desc = "Copilot Chat [P]rompts" },
	{ "<leader>cm", "<cmd>CopilotChatModels<CR>", desc = "Copilot Chat [M]odels" },
	{ "<leader>ca", "<cmd>CopilotChatAgents<CR>", desc = "Copilot Chat [A]gents" },
})
