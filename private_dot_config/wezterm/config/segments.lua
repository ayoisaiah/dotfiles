local wezterm = require("wezterm")

local M = {}
--
function M.get_right_status_segments(window, pane)
	local workspace = window:active_workspace()

	local items = {
		"🧠 " .. workspace,
	}

	local result = {}
	for _, v in ipairs(items) do
		if v and v ~= "" then
			table.insert(result, v)
		end
	end
	return result
end

return M
