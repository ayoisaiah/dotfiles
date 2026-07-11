local config = function()
	local debug = require("lang.debuggers")
	local dapgo = require("dap-go")
	local wk = require("which-key")

	dapgo.setup(debug.go_dap_options)

	debug.add_go_keymaps(wk)
end

return {
	"leoluz/nvim-dap-go",
	event = { "BufEnter *.go" },
	config = config,
}
