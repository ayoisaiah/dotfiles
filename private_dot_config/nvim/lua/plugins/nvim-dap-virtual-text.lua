return {
	"theHamsta/nvim-dap-virtual-text",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("nvim-dap-virtual-text").setup({
			only_first_definition = false,
		})
	end,
}
