local wezterm = require("wezterm")

local M = {}
--
function M.get_right_status_segments(window, pane)
	local domain = pane:get_domain_name()

	local items = {
		wezterm.strftime("  %a, %b %-d"),
		domain,
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
