local M = {}

local env = {}

--- Loads a dotenv file into a persistent table and returns the table.
--- Use directly, or in conjunction with from_env() to access variables.
---
---@param file string The path to the dotenv file to load.
---@return table env A table key-value pair of environment variables. If no
---variables found in the file, returns an empty table.
function M.load_dotenv_file(file)
	local f = io.open(file, "r")
	if not f then
		-- vim.notify(string.format("Could not open env file at %s", file), vim.log.levels.DEBUG)
		return env
	end

	for l in f:lines() do
		-- Matches on .env format 'KEY=VAL'
		local key, val = string.match(l, "^%s*([%w_]+)%s*=%s*(.+)%s*$")
		if key and val then
			val = string.gsub(val, '^"(.*)"$', "%1")
			val = string.gsub(val, "^'(.*)'$", "%1")
			env[key] = val
		end
	end
	f:close()
	return env
end

--- Returns the value from the given variable, or a default value if provided.
--- Takes values from the following sources in priority order:
--- 1. dotenv file
--- 2. OS environment variables
---
--- If using a dotenv file, you must call load_dotenv_file() first, so that the dotenv
--- file is loaded into memory.
---
---@param varname string The name of the environment variable.
---@param default any? An optional default value to return if variable is not found.
---@return any
function M.get_val(varname, default)
	local val = env[varname] and env[varname] or os.getenv(varname)
	return val and val or default
end

return M
