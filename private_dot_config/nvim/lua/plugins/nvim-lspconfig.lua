local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.marksman.setup({})
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	init_options = {
		html = {
			options = {
				-- TODO: investigate https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

return {
	"neovim/nvim-lspconfig",
}
