local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local map = vim.api.nvim_buf_set_keymap
local fn = vim.fn
local o = vim.opt

-- Customize buffer behaviour in different scenarios
augroup("buffer", {
	clear = true,
})

autocmd("BufWritePost", {
	group = "buffer",
	pattern = vim.fn.expand("~") .. "/.local/share/chezmoi/*",
	command = "silent! !chezmoi apply --force",
	desc = "Auto update dotfiles",
})

autocmd({ "BufRead", "BufNewFile" }, {
	group = "buffer",
	pattern = { "*.md", "*.txt" },
	command = "setlocal spell",
	desc = "Spell check markdown files",
})

autocmd("BufWritePre", {
	group = "buffer",
	pattern = "*",
	command = "%s/s+$//e",
	desc = "Strip trailing whitespace from all files",
})

autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
	group = "buffer",
	pattern = "*",
	command = "set relativenumber",
	desc = "Turn relative number on in normal mode",
})

autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
	group = "buffer",
	pattern = "*",
	command = "set norelativenumber",
	desc = "Turn relative number off in insert mode or when window loses focus",
})

autocmd("FileType", {
	group = "buffer",
	pattern = { "gitcommit", "gitrebase" },
	command = "startinsert | 1",
	desc = "Start git messages in insert mode",
})

autocmd("FileType", {
	group = "buffer",
	pattern = "*.md",
	callback = function()
		o.spell = true
		o.spelllang = { "en_us" }
	end,
	desc = "Enable spell checking in markdown files",
})

autocmd("BufReadPost", {
	group = "buffer",
	pattern = "*",
	callback = function()
		if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
			fn.setpos(".", fn.getpos("'\""))
			vim.cmd("normal zz")
			vim.cmd("silent! foldopen")
		end
	end,
	desc = "Return to last edit position when opening files",
})

autocmd("FocusLost", {
	group = "buffer",
	pattern = "*",
	command = "silent! wa",
	desc = "Write all unsaved buffers when I unfocus the editor",
})

-- Appearance group
augroup("appearance", {
	clear = true,
})

autocmd("ColorScheme", {
	group = "appearance",
	pattern = "*",
	command = "highlight VertSplit cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#363646 guifg=#000000",
	desc = "highlight vertical split with a black on light grey background",
})

-- Terminal group
augroup("terminal", {
	clear = true,
})

autocmd("TermOpen", {
	group = "terminal",
	pattern = "term://*",
	callback = function()
		local opts = { noremap = true }
		map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
		map(0, "t", "jk", [[<C-\><C-n>]], opts)
		map(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		map(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		map(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		map(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
	end,
	desc = "Make it easy to move in and out of terminal while keeping it open",
})
