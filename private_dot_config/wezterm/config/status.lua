local wezterm = require("wezterm")

local segments = require("config.segments")

wezterm.on("update-status", function(window, pane)
	local segs = segments.get_right_status_segments(window, pane)
	local color_scheme = window:effective_config().resolved_palette

	local bg = wezterm.color.parse(color_scheme.background)
	local fg = color_scheme.foreground

	local gradient_to, gradient_from = bg, bg
	-- if is_appearance_dark() then
	gradient_from = gradient_to:lighten(0.15)
	-- else
	-- 	gradient_from = gradient_to:darken(0.15)
	-- end
	local gradient = wezterm.color.gradient({
		orientation = "Horizontal",
		colors = { gradient_from, gradient_to },
	}, #segs)

	local elements = {}

	for i, seg in ipairs(segs) do
		local is_first = i == 1

		if is_first then
			table.insert(elements, { Background = { Color = "none" } })
		end
		table.insert(elements, { Foreground = { Color = gradient[i] } })
		table.insert(elements, { Text = "" })

		table.insert(elements, { Foreground = { Color = fg } })
		table.insert(elements, { Background = { Color = gradient[i] } })
		table.insert(elements, { Text = " " .. seg .. " " })
	end
	window:set_right_status(wezterm.format(elements))
end)

-- wezterm.on("config-reloaded", function(window, pane)
-- 	window:toast_notification("WezTerm", "Configuration reloaded", nil, 2000)
-- end)
