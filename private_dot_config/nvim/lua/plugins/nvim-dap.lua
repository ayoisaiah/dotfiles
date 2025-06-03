local config = function()
	local dap = require("dap")
	local dapui = require("dapui")
	local wk = require("which-key")

	dap.configurations.go = {}

	dapui.setup()

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	-- TODO: Setup proper highlighting
	-- https://github.com/mfussenegger/nvim-dap/discussions/355

	vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapLogPoint", { text = "🔶", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "🟥", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "🛑", texthl = "", linehl = "", numhl = "" })

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

return {
	"mfussenegger/nvim-dap",
	config = config,
	dependencies = {
		"LiadOz/nvim-dap-repl-highlights",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"Weissle/persistent-breakpoints.nvim",
	},
}
