local config = function()
	local dapgo = require("dap-go")
	local wk = require("which-key")

	dapgo.setup()

	wk.register({
		name = "Debugger",
		t = { "<cmd>lua require('dap-go').debug_test()<CR>", "Debug closest test" },
		T = { "<cmd>lua require('dap-go').debug_last_test()<CR>", "Debug last run test" },
	}, {
		prefix = "<leader>d",
	})
end

return {
	"leoluz/nvim-dap-go",
	event = { "BufEnter *.go" },
	config = config,
}
