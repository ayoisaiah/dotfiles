-- File: resurrect/events.lua
-- resurrect.wezterm event listener configuration
--
-- This module configures event listeners for the resurrect.wezterm plugin.

local wezterm = require("wezterm")
-- local notify = require("../notify")
local suppress_notification = false

wezterm.on("resurrect.error", function(err)
	wezterm.log_error("Resurrect Error: " .. err)
end)

wezterm.on("resurrect.periodic_save", function()
	suppress_notification = true
	wezterm.log_info("Resurrect: Periodic save started")
end)

wezterm.on("resurrect.save_state.finished", function(session_path)
	local is_workspace_save = session_path:find("state/workspace")

	if is_workspace_save == nil then
		return
	end

	if suppress_notification then
		suppress_notification = false
		return
	end

	local path = session_path:match(".+/([^+]+)$")
	local name = path:match("^(.+)%.json$")
	wezterm.log_info("Resurrect: Saved workspace " .. name)
end)

wezterm.on("resurrect.load_state.finished", function(name, type)
	wezterm.log_info("Resurrect: Completed loading " .. type .. " state: " .. name)
end)
