local wezterm = require("wezterm")

return function(config)
	local launch_menu = {}

	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		table.insert(launch_menu, {
			label = "Windows PowerShell",
			args = { "powershell.exe", "-NoLogo" },
		})
	end

	config.launch_menu = launch_menu
end
