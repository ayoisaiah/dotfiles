local config = function()
	local dap = require("dap")
	local dapui = require("dapui")
	local debug = require("lang.debuggers")
	local wk = require("which-key")

	require("dapui").setup()
	require("nvim-dap-repl-highlights").setup()
	require("nvim-dap-virtual-text").setup({
		only_first_definition = false,
	})
	require("persistent-breakpoints").setup({
		load_breakpoints_event = { "BufReadPost" },
	})
	require("dap-go").setup(debug.go_dap_options)

	debug.setup_dap(dap)
	debug.setup_dapui_listeners(dap, dapui)

	-- TODO: Setup proper highlighting
	-- https://github.com/mfussenegger/nvim-dap/discussions/355

	debug.add_core_keymaps(wk)
end

return {
	"mfussenegger/nvim-dap",
	config = config,
	keys = {
		{ "<F5>", "<cmd>lua require('dap').continue()<CR>", desc = "Continue" },
		{ "<F10>", "<cmd>lua require('dap').step_over()<CR>", desc = "Step over" },
		{ "<F11>", "<cmd>lua require('dap').step_into()<CR>", desc = "Step into" },
		{ "<F12>", "<cmd>lua require('dap').step_out()<CR>", desc = "Step out" },
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
		{ "<leader>dr", "<cmd>lua require('dap').restart()<CR>", desc = "Restart debugging session" },
		{ "<leader>dT", "<cmd>lua require('dap-go').debug_last_test()<CR>", desc = "Debug last run test" },
		{ "<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug closest test" },
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle dap ui",
		},
		{ "<leader>dx", "<cmd>lua require('dap').terminate()<CR>", desc = "Terminate debugging session" },
	},
	dependencies = {
		"LiadOz/nvim-dap-repl-highlights",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"Weissle/persistent-breakpoints.nvim",
	},
}
