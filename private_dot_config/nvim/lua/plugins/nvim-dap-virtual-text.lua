return {
	"theHamsta/nvim-dap-virtual-text",
	config = function()
		require("nvim-dap-virtual-text").setup({
			only_first_definition = false,
		})
	end,
}
