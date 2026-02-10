local wezterm = require("wezterm")
local projects = require("projects")

local act = wezterm.action
local mux = wezterm.mux

-- Helpers ---------------------------------------------------------------------
local function move_focus(key, direction)
	return {
		key = key,
		mods = "ALT",
		action = act.ActivatePaneDirection(direction),
	}
end

local function split(key, split_action)
	return {
		key = key,
		mods = "ALT",
		action = split_action,
	}
end

local function switch_tab_number(key, idx)
	return {
		key = key,
		mods = "ALT",
		action = act.ActivateTab(idx),
	}
end

local function leader(key, action)
	return {
		key = key,
		mods = "LEADER",
		action = action,
	}
end

-- Keymaps ---------------------------------------------------------------------
return function(config)
	local keys = {}

	-- Splits --------------------------------------------------------------------
	table.insert(keys, split("r", act.SplitHorizontal({ domain = "CurrentPaneDomain" })))
	table.insert(keys, split("d", act.SplitVertical({ domain = "CurrentPaneDomain" })))

	-- Pane navigation -----------------------------------------------------------
	table.insert(keys, move_focus("h", "Left"))
	table.insert(keys, move_focus("j", "Down"))
	table.insert(keys, move_focus("k", "Up"))
	table.insert(keys, move_focus("l", "Right"))

	-- Tabs ----------------------------------------------------------------------
	table.insert(keys, leader("c", act.SpawnTab("CurrentPaneDomain")))
	table.insert(keys, leader("w", act.ShowTabNavigator))
	table.insert(keys, { key = "&", mods = "LEADER|SHIFT", action = act.CloseCurrentTab({ confirm = true }) })

	table.insert(keys, {
		key = ",",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	})

	-- Create and rename tab immediately
	table.insert(keys, {
		key = "C",
		mods = "LEADER|SHIFT",
		action = wezterm.action_callback(function(window, pane)
			window:perform_action(act.SpawnTab("CurrentPaneDomain"), pane)

			window:perform_action(
				act.PromptInputLine({
					description = "New tab name",
					action = wezterm.action_callback(function(win, _pane, line)
						if line then
							win:active_tab():set_title(line)
						end
					end),
				}),
				pane
			)
		end),
	})

	-- Tab navigation (ALT+number) ----------------------------------------------
	for i = 1, 9 do
		table.insert(keys, switch_tab_number(tostring(i), i - 1))
	end

	-- Tab navigation (relative) -------------------------------------------------
	table.insert(keys, { key = ",", mods = "ALT", action = act.ActivateTabRelative(1) })
	table.insert(keys, { key = ".", mods = "ALT", action = act.ActivateTabRelative(-1) })

	-- Tab reordering ------------------------------------------------------------
	table.insert(keys, { key = "o", mods = "ALT", action = act.MoveTabRelative(1) })
	table.insert(keys, { key = "i", mods = "ALT", action = act.MoveTabRelative(-1) })
	table.insert(keys, { key = "I", mods = "ALT|SHIFT", action = act.MoveTab(0) })
	table.insert(keys, {
		key = "O",
		mods = "ALT|SHIFT",
		action = wezterm.action_callback(function(window, pane)
			local tabs = window:mux_window():tabs()
			window:perform_action(wezterm.action.MoveTab(#tabs - 1), pane)
		end),
	})

	-- Workspace / launcher / projects ------------------------------------------
	table.insert(keys, leader("p", projects.choose_project()))
	table.insert(keys, leader("s", act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" })))
	table.insert(keys, {
		key = "$",
		mods = "LEADER|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for session",
			action = wezterm.action_callback(function(window, _pane, line)
				if line then
					mux.rename_workspace(window:mux_window():get_workspace(), line)
				end
			end),
		}),
	})
	table.insert(keys, {
		key = "n",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "New workspace name",
			action = wezterm.action_callback(function(window, pane, line)
				if not line or line == "" then
					return
				end

				window:perform_action(
					act.SwitchToWorkspace({
						name = line,
						-- Optional: what to spawn in the new workspace (only used when creating)
						spawn = { domain = "CurrentPaneDomain" },
					}),
					pane
				)
			end),
		}),
	})

	-- Config / Debug ------------------------------------------------------------
	table.insert(keys, {
		key = "R",
		mods = "LEADER|SHIFT",
		action = act.ReloadConfiguration,
	})

	-- Pane management -----------------------------------------------------------
	table.insert(keys, leader("x", act.CloseCurrentPane({ confirm = false })))
	table.insert(keys, leader("z", act.TogglePaneZoomState))

	-- Copy mode -----------------------------------------------------------------
	table.insert(keys, leader("[", act.ActivateCopyMode))

	-- Quick actions -------------------------------------------------------------
	table.insert(keys, {
		key = "u",
		mods = "ALT",
		action = act.QuickSelectArgs({
			label = "open url",
			patterns = {
				"\\((https?://\\S+)\\)",
				"\\[(https?://\\S+)\\]",
				"\\{(https?://\\S+)\\}",
				"<(https?://\\S+)>",
				"\\bhttps?://\\S+[)/a-zA-Z0-9-]+",
			},
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	})

	local function extend(dst, src)
		for _, v in ipairs(src or {}) do
			table.insert(dst, v)
		end
	end

	-- extend(keys, require("config.plugins.resurrect.config").keys)

	config.keys = keys
end
