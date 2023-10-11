local config = function()
	local dap = require("dap")
	local dapui = require("dapui")
	local wk = require("which-key")

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
	vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

	wk.register({
		name = "Debugger",
		["<F5>"] = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
		["<F10>"] = { "<cmd>lua require('dap').step_over()<CR>", "Step over" },
		["<F11>"] = { "<cmd>lua require('dap').step_into()<CR>", "Step into" },
		["<F12>"] = { "<cmd>lua require('dap').step_out()<CR>", "Step out" },
	})

	wk.register({
		name = "Debugger",
		b = { "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<CR>", "Toggle breakpoint" },
		c = { "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<CR>", "Set breakpoint" },
		d = { "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<CR>", "Clear all breakpoints" },
		l = {
			"<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
			"Set logpoint",
		},
		r = { "<cmd>lua require('dap').restart()<CR>", "Restart the debugging session" },
		x = { "<cmd>lua require('dap').terminate()<CR>", "Terminate the debugging session" },
	}, {
		prefix = "<leader>d",
	})
end

return {
	"mfussenegger/nvim-dap",
	config = config,
	dependencies = {
		"LiadOz/nvim-dap-repl-highlights",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
		"Weissle/persistent-breakpoints.nvim",
	},
}
