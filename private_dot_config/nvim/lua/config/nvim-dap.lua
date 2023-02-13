local dap = require("dap")
local wk = require("which-key")

dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

wk.register({
	name = "nvim-dap",
	["<F5>"] = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
	["<F10>"] = { "<cmd>lua require('dap').step_over()<CR>", "Step over" },
	["<F11>"] = { "<cmd>lua require('dap').step_into()<CR>", "Step into" },
	["<F12>"] = { "<cmd>lua require('dap').step_out()<CR>", "Step out" },
})

wk.register({
	name = "+nvim-dap",
	b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
	B = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Set breakpoint" },
	s = {
		"<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
		"Set logpoint",
	},
	c = { "<cmd>lua require('dap').clear_breakpoints()<CR>", "Clear all breakpoints" },
	l = { "<cmd>lua require('dap').list_breakpoints()<CR>", "List all breakpoints" },
	r = { "<cmd>lua require('dap').repl.toggle()<CR>", "Toggle the REPL" },
	t = { "<cmd>lua require('dap').terminate()<CR>", "Terminate the debugging session" },
}, {
	prefix = "<leader>b",
})
