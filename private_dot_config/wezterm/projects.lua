local wezterm = require("wezterm")
local module = {}

local project_dir = [[//wsl.localhost/Ubuntu-24.04/home/ayo/dev/repos]]

local function project_dirs()
	local projects = { wezterm.home_dir }

	local glob_pattern = project_dir .. "/*"

	local success, results = pcall(wezterm.glob, glob_pattern)

	if success and results then
		for _, dir in ipairs(results) do
			table.insert(projects, dir)
		end
	else
		wezterm.log_error("Could not find projects in: " .. glob_pattern)
	end

	return projects
end

function module.choose_project()
	local choices = {}
	for _, value in ipairs(project_dirs()) do
		table.insert(choices, { label = value })
	end

	return wezterm.action.InputSelector({
		title = "Projects",
		choices = choices,
		fuzzy = true,
		action = wezterm.action_callback(function(child_window, child_pane, id, label)
			if not label then
				return
			end

			local wsl_prefix = "^//wsl%.localhost/Ubuntu%-24%.04"

			local linux_path = string.gsub(label, wsl_prefix, "")

			wezterm.log_info(linux_path)

			child_window:perform_action(
				wezterm.action.SwitchToWorkspace({
					name = label:match("([^/]+)$"),
					-- Here's the meat. We'll spawn a new terminal with the current working
					-- directory set to the directory that was picked.
					spawn = { cwd = linux_path },
				}),
				child_pane
			)
		end),
	})
end

return module
