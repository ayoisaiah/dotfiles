local config = function()
	local dap = require("dap")
	local dapui = require("dapui")
	local debug = require("lang.debuggers")
	local wk = require("which-key")

	dapui.setup()
	debug.setup_dap(dap)
	debug.setup_dapui_listeners(dap, dapui)

	-- TODO: Setup proper highlighting
	-- https://github.com/mfussenegger/nvim-dap/discussions/355

	debug.add_core_keymaps(wk)
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
