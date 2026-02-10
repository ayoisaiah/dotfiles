local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local fn = vim.fn
local o = vim.opt

-- Customize buffer behaviour in different scenarios
local bufferGroup = augroup("buffer", {
	clear = true,
})

local envGroup = augroup("__env", {
	clear = true,
})

local appearanceGroup = augroup("appearance", {
	clear = true,
})

autocmd("BufWritePost", {
	group = bufferGroup,
	pattern = vim.fn.expand("~") .. "/.local/share/chezmoi/*",
	command = "silent! !chezmoi apply --force",
	desc = "Auto update dotfiles",
})

autocmd({ "BufRead", "BufNewFile" }, {
	group = bufferGroup,
	pattern = { "*.md", "*.txt" },
	command = "setlocal spell",
	desc = "Spell check markdown files",
})

autocmd("BufWritePre", {
	group = bufferGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
	desc = "Strip trailing whitespace from all files",
})

autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
	group = bufferGroup,
	pattern = "*",
	command = "set relativenumber",
	desc = "Turn relative number on in normal mode",
})

autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
	group = bufferGroup,
	pattern = "*",
	command = "set norelativenumber",
	desc = "Turn relative number off in insert mode or when window loses focus",
})

autocmd("FileType", {
	group = bufferGroup,
	pattern = { "gitcommit", "gitrebase" },
	command = "startinsert | 1",
	desc = "Start git messages in insert mode",
})

autocmd("TextYankPost", {
	group = bufferGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
	desc = "Highlight text briefly after yanking",
})

autocmd("FileType", {
	group = bufferGroup,
	pattern = "*.md",
	callback = function()
		o.spell = true
		o.spelllang = { "en_us" }
	end,
	desc = "Enable spell checking in markdown files",
})

autocmd("BufReadPost", {
	group = bufferGroup,
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
	group = bufferGroup,
	pattern = "*",
	command = "silent! wa",
	desc = "Write all unsaved buffers when I unfocus the editor",
})

autocmd("ColorScheme", {
	group = appearanceGroup,
	pattern = "*",
	command = "highlight VertSplit cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#363646 guifg=#000000",
	desc = "highlight vertical split with a black on light grey background",
})

autocmd({ "BufEnter", "BufNewFile" }, {
	group = envGroup,
	pattern = "*.env",
	callback = function()
		vim.diagnostic.enable(false, { bufnr = 0 })
		vim.diagnostic.hide(nil, 0)
		vim.diagnostic.reset(nil, 0)
		-- lsp.buf_detach_client(bufnr, client.id)
	end,
	desc = "Disable diagnostics in .env files",
})

autocmd({ "BufEnter", "BufNewFile" }, {
	group = bufferGroup,
	pattern = ".djlintrc",
	command = "set filetype=json",
	desc = "Highlight .djlintrc files as JSON",
})
