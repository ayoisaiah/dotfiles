require("femaco").setup({})

local wk = require("which-key")

wk.register({
	name = "+femaco",
	f = { "<cmd>lua require('femaco.edit').edit_code_block()<CR>", "Edit code snippet" },
}, { prefix = "<leader>f" })
