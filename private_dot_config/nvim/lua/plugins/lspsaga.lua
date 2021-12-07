local saga = require("lspsaga")

saga.setup({
	error_sign = "🐞",
	warn_sign = "⚡",
	hint_sign = "💡",
	infor_sign = "⚠️",
	max_preview_lines = 15,
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- lsp provider to find the cursor word definition and reference
map("n", "gh", ":Lspsaga lsp_finder<CR>", opts)

map("n", "gs", '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
map("n", "<leader>k", '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)

-- scroll down hover doc or scroll in definition preview
map("n", "]z", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)

-- scroll up hover doc
map("n", "[z", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

-- rename
map("n", "<leader>rn", '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
-- diganostics
map("n", "]c", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
map("n", "[c", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)

map("n", "gd", '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', opts)

map("n", "<leader>cd", '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
map("n", "<leader>cc", '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>', opts)
