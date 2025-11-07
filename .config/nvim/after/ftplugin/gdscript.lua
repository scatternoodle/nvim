local envvar_host = "GODOT_HOST"
local default_host = "127.0.0.1"

local envvar_port = "GDSCRIPT_PORT"
local default_port = "6005"

local envvar_pipefile = "GODOT_PIPEFILE"
local default_pipefile = "tmp/godot_pipe"

local godot = require("godot")
local env = require("env")

local function start_lsp_client()
	local root_dir = godot.find_godot_root()
	if not root_dir then
		vim.notify("Cannot start LSP client: Not in a Godot project.", vim.log.levels.WARN)
		return
	end

	_ = env.load_dotenv_file(root_dir .. "/.env")

	local host = env.get_val(envvar_host, default_host)
	local port = env.get_val(envvar_port, default_port)
	local pipe = env.get_val(envvar_pipefile, default_pipefile)

	pipe = root_dir .. pipe

	local project_name = vim.fn.fnamemodify(root_dir, ":h")
	local server_name = "vimgodotserver_" .. project_name

	vim.lsp.start({
		name = server_name,
		cmd = vim.lsp.rpc.connect(host, tonumber(port)),
		root_dir = root_dir,
	})
end

start_lsp_client()
