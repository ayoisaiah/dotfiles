local config = function()
	local dapgo = require("dap-go")
	local wk = require("which-key")

	dapgo.setup()

	wk.add({
		{ "<leader>d", group = "Debugger" },
		{ "<leader>dT", "<cmd>lua require('dap-go').debug_last_test()<CR>", desc = "Debug last run test" },
		{ "<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug closest test" },
	})
end

return {
	"leoluz/nvim-dap-go",
	event = { "BufEnter *.go" },
	config = config,
}
