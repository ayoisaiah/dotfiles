local config = function()
	local dapui = require("dapui")
	local wk = require("which-key")

	dapui.setup()

	wk.add({
		{ "<leader>d", group = "Debugger" },
		{ "<leader>du", dapui.toggle, desc = "Toggle dap ui" },
	})
end

return {
	"rcarriga/nvim-dap-ui",
	config = config,
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
}
