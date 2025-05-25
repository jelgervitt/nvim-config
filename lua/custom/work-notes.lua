local M = {}

function M.create_note(dir, note_type, note_snippet, cursor_coords)
	local workspace_path = vim.loop.cwd()
	local project_name = vim.fn.fnamemodify(workspace_path, ":t")
	local date = os.date("%Y-%m-%d")

	local custom_label = ""
	local note_name = ""
	local file_name = ""

	if note_type == "support_doc" then
		custom_label = vim.fn.input("Support document title: ")
		if custom_label == "" then
			print("Note creation canceled.")
			return
		end
		file_name = custom_label .. " - " .. project_name
	end

	if note_type == "moc" then
		file_name = project_name .. " - MOC"
	end

	if file_name == "" then
		file_name = string.format("%s - %s - %s", date, note_type, project_name)
	end

	local notes_dir = dir and (workspace_path .. "/" .. dir) or workspace_path
	local filepath = notes_dir .. "/" .. file_name .. ".md"
	local file = io.open(filepath, "w")

	note_snippet = note_snippet or ""

	-- create directory if it doesn't exist
	vim.fn.mkdir(notes_dir, "p")

	-- Write the snippet to the new file
	if file then
		file:write(note_snippet)
		file:close()
		vim.cmd("edit " .. vim.fn.fnameescape(filepath))

		if cursor_coords ~= nil then
			vim.schedule(function()
				vim.api.nvim_win_set_cursor(0, cursor_coords)
			end)
		end
	else
		print("Failed to create file at " .. filepath)
	end
end

function M.create_work_note()
	local note_snippet = "# ToDo\n\n- [ ] \n\n\n# Work notes\n\nStart time: "
		.. os.date("%H:%M")
		.. "\nEnd time: \n\n\n # To communicate\n\n"

	M.create_note("Work notes", "Work note", note_snippet, { 3, 7 })
end

function M.create_meeting_note()
	local note_snippet = "# Meeting preparation\n\n\n# Meeting notes\n\n\n# To communicate\n\n"

	M.create_note("Work notes", "Meeting note", note_snippet, { 3, 1 })
end

function M.create_moc_note()
	local note_snippet = "# TODO\n\n\n\n# Project scope\n"

	M.create_note(nil, "moc", note_snippet, { 3, 1 })
end

function M.create_support_doc()
	local note_snippet = "# "

	M.create_note("Support documents", "support_doc", note_snippet, { 1, 3 })
end

function M.insert_date()
	local date = os.date("%Y%m%d")
	vim.api.nvim_put({ date }, "c", true, true)
end

function M.insert_time()
	local time = os.date("%H:%M")
	vim.api.nvim_put({ time }, "c", true, true)
end

return M
