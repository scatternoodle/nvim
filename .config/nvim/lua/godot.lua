local M = {}

-- Searches upward from CWD and returns the Godot project root directory name,
-- if CWD is within a godot project.
function M.find_godot_root()
	return vim.fs.dirname(vim.fs.find({ "project.godot" }, { upward = true })[1])
end

-- If CWD is within a Godot project and starts an RPC server if one does not
-- already exist for that project.
--
-- This ensures only one server per Godot project, though there may be multiple
-- servers if multiple vim processes are running for multiple different Godot
-- projects - this is desired, as each is essentially its own island.
function M.start_project_server()
	local root_dir = M.find_godot_root()
	if not root_dir then
		return
	end

	local project_name = vim.fn.fnamemodify(root_dir, ":t")
	local server_name = "godohost_" .. project_name

	local serverlist = vim.fn.serverlist()
	local is_server_running = false
	for _, server in ipairs(serverlist) do
		if server == server_name then
			is_server_running = true
		end
	end

	print(vim.inspect(vim.fn.serverlist()))
	print("Looking for: ", server_name)
	if is_server_running then
		return
	end
	vim.fn.serverstart(server_name)
end

return M
