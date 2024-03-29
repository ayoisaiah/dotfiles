local config = function()
	local wk = require("which-key")
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

	require("toggleterm").setup({
		shell = "/usr/bin/fish",
		open_mapping = "<leader>tt",
		terminal_mappings = true,
		insert_mappings = false,
		direction = "float",
		size = 20,
		hide_numbers = true,
		highlights = {
			Normal = {
				guibg = "#16161D",
			},
		},
	})

	function Lazygit_toggle()
		lazygit:toggle()
	end

	function _G.set_terminal_keymaps()
		local opts = { buffer = 0 }
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	end

	-- if you only want these mappings for toggle term use term://*toggleterm#* instead
	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

	wk.register({
		name = "Terminal",
		l = { "<cmd>lua Lazygit_toggle()<CR>", "Toggle lazygit terminal" },
		f = { "<cmd>ToggleTerm direction=float<CR>", "floating terminal" },
		h = { "<cmd>ToggleTerm direction=horizontal<CR>", "horizontal terminal" },
	}, {
		prefix = "<leader>t",
	})

	wk.register({
		name = "Git",
		l = { "<cmd>lua Lazygit_toggle()<CR>", "Toggle lazygit terminal" },
	}, {
		prefix = "<leader>g",
	})
end

return {
	"akinsho/toggleterm.nvim",
	config = config,
	event = "VeryLazy",
}
