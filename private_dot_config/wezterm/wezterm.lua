local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 10.0
config.color_scheme = "Molokai"
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false
config.default_domain = "WSL:Ubuntu-24.04"
config.default_cursor_style = "SteadyBar"

local launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "Windows PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})
	table.insert(launch_menu, {
		label = "Work",
		args = { "zellij attach Work" },
	})
end

config.launch_menu = launch_menu

return config
