local wk = require("which-key")
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

require("toggleterm").setup({
	shell = "/usr/bin/fish",
	open_mapping = "<leader>vv",
	insert_mappings = true,
	terminal_mappings = true,
	size = 20,
	hide_numbers = true,
})

function _lazygit_toggle()
	lazygit:toggle()
end

wk.register({
	name = "toggleterm",
	l = { "<cmd>lua _lazygit_toggle()<CR>", "Toggle lazygit terminal" },
}, {
	prefix = "<leader>v",
})
