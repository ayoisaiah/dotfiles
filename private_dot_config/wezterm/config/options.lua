local wezterm = require("wezterm")
local appearance = require("appearance")

return function(config)
	config.use_fancy_tab_bar = true
	config.check_for_updates = false
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

	config.font = wezterm.font("JetBrainsMono Nerd Font")
	config.font_size = 10.0

	config.color_scheme = appearance.color_scheme
	config.window_decorations = "RESIZE"
	config.hide_tab_bar_if_only_one_tab = false
	config.default_domain = "WSL:Ubuntu-24.04"
	config.default_cursor_style = "SteadyBar"

	config.inactive_pane_hsb = {
		saturation = 0.5,
		brightness = 0.5,
	}

	config.tab_bar_at_bottom = true
end
