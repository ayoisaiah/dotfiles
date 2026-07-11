local M = {}

M.go_configurations = {}

M.go_dap_options = {
	dap_configurations = M.go_configurations,
}

M.signs = {
	DapBreakpoint = { text = "🔴", texthl = "", linehl = "", numhl = "" },
	DapLogPoint = { text = "🔶", texthl = "", linehl = "", numhl = "" },
	DapRejected = { text = "🚫", texthl = "", linehl = "", numhl = "" },
	DapBreakpointCondition = { text = "🟥", texthl = "", linehl = "", numhl = "" },
	DapStopped = { text = "🛑", texthl = "", linehl = "", numhl = "" },
}

function M.setup_dap(dap)
	dap.configurations.go = M.go_configurations

	for name, sign in pairs(M.signs) do
		vim.fn.sign_define(name, sign)
	end
end

function M.setup_dapui_listeners(dap, dapui)
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

function M.add_core_keymaps(wk)
	wk.add({
		{ "<F10>", "<cmd>lua require('dap').step_over()<CR>", desc = "Step over" },
		{ "<F11>", "<cmd>lua require('dap').step_into()<CR>", desc = "Step into" },
		{ "<F12>", "<cmd>lua require('dap').step_out()<CR>", desc = "Step out" },
		{ "<F5>", "<cmd>lua require('dap').continue()<CR>", desc = "Continue" },
	})

	wk.add({
		{ "<leader>d", group = "Debugger" },
		{
			"<leader>db",
			"<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<CR>",
			desc = "Toggle breakpoint",
		},
		{
			"<leader>dc",
			"<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<CR>",
			desc = "Set conditional breakpoint",
		},
		{
			"<leader>dd",
			"<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<CR>",
			desc = "Clear all breakpoints",
		},
		{
			"<leader>dl",
			"<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
			desc = "Set logpoint",
		},
		{ "<leader>dr", "<cmd>lua require('dap').restart()<CR>", desc = "Restart the debugging session" },
		{ "<leader>dx", "<cmd>lua require('dap').terminate()<CR>", desc = "Terminate the debugging session" },
	})
end

function M.add_go_keymaps(wk)
	wk.add({
		{ "<leader>d", group = "Debugger" },
		{ "<leader>dT", "<cmd>lua require('dap-go').debug_last_test()<CR>", desc = "Debug last run test" },
		{ "<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug closest test" },
	})
end

return M
