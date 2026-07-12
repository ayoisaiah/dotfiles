local M = {}

M.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

M.prose_servers = {
	ltex_plus = true,
	vale_ls = true,
}

local prose_diagnostics_enabled = {}

local function lsp_clients(bufnr)
	if vim.lsp.get_clients then
		return vim.lsp.get_clients({ bufnr = bufnr })
	end

	return vim.lsp.get_active_clients({ bufnr = bufnr })
end

local function diagnostic_namespace(client)
	if not vim.lsp.diagnostic or not vim.lsp.diagnostic.get_namespace then
		return nil
	end

	local ok, namespace = pcall(vim.lsp.diagnostic.get_namespace, client.id)
	if ok then
		return namespace
	end
end

function M.spell_words()
	local ok, lines = pcall(vim.fn.readfile, M.spellfile)
	if not ok then
		return {}
	end

	local words = {}
	for _, line in ipairs(lines) do
		local word = vim.trim(line)
		if word ~= "" and not word:match("^#") and not word:match("^/") and not word:match("^!") then
			words[#words + 1] = word:gsub("/.*$", "")
		end
	end

	table.sort(words)
	return words
end

function M.rebuild_spellfile(opts)
	opts = opts or {}

	vim.cmd("silent! mkspell! " .. vim.fn.fnameescape(M.spellfile))

	if not opts.quiet then
		vim.notify("Rebuilt " .. M.spellfile .. ".spl")
	end
end

function M.open_spellfile()
	vim.cmd.edit(vim.fn.fnameescape(M.spellfile))
end

function M.sync_spellfile(opts)
	opts = opts or {}

	if vim.fn.executable("chezmoi") ~= 1 then
		return
	end

	vim.fn.system({ "chezmoi", "re-add", M.spellfile })
	if vim.v.shell_error == 0 then
		if not opts.quiet then
			vim.notify("Synced " .. M.spellfile .. " to chezmoi")
		end
	elseif not opts.quiet then
		vim.notify("Failed to sync " .. M.spellfile .. " to chezmoi", vim.log.levels.WARN)
	end
end

function M.after_spellfile_change()
	M.rebuild_spellfile({ quiet = true })
	M.sync_spellfile({ quiet = true })
end

function M.set_prose_diagnostics(bufnr, enabled)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	prose_diagnostics_enabled[bufnr] = enabled

	for _, client in ipairs(lsp_clients(bufnr)) do
		if M.prose_servers[client.name] then
			local namespace = diagnostic_namespace(client)
			if namespace then
				vim.diagnostic.enable(enabled, { bufnr = bufnr, namespace = namespace })
			else
				vim.diagnostic.enable(enabled, { bufnr = bufnr })
			end
		end
	end
end

function M.toggle_prose_diagnostics(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local enabled = prose_diagnostics_enabled[bufnr] ~= false

	M.set_prose_diagnostics(bufnr, not enabled)
	vim.notify("Markdown prose diagnostics " .. (enabled and "disabled" or "enabled"))
end

function M.setup_buffer()
	vim.opt_local.spell = true
	vim.opt_local.spellfile = M.spellfile
	vim.opt_local.spelllang = { "en_us" }
	vim.opt_local.wrap = true
	vim.opt_local.linebreak = true
	vim.opt_local.breakindent = true
	vim.opt_local.textwidth = 80
	vim.opt_local.colorcolumn = "+1"
	vim.opt_local.formatoptions = vim.opt_local.formatoptions + "n"

	local ok, wk = pcall(require, "which-key")
	if ok then
		wk.add({
			{ "<leader>m", group = "Markdown" },
			{ "<leader>mp", M.toggle_prose_diagnostics, desc = "Toggle prose diagnostics" },
			{ "<leader>mq", vim.diagnostic.setloclist, desc = "Markdown diagnostics" },
			{ "<leader>mr", "<cmd>RenderMarkdown buf_toggle<CR>", desc = "Toggle rendered buffer" },
			{ "<leader>mR", "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle rendered markdown" },
			{ "<leader>mS", M.rebuild_spellfile, desc = "Rebuild spellfile" },
			{ "<leader>mw", M.open_spellfile, desc = "Open word list" },
		}, { buffer = 0 })
	end

	vim.keymap.set("n", "zg", "zg<cmd>lua require('lang.markdown').after_spellfile_change()<CR>", {
		buffer = true,
		desc = "Add word to synced spellfile",
		silent = true,
	})
	vim.keymap.set("n", "zug", "zug<cmd>lua require('lang.markdown').after_spellfile_change()<CR>", {
		buffer = true,
		desc = "Remove word from synced spellfile",
		silent = true,
	})
end

function M.setup_markdown_nvim_keymaps(bufnr)
	local opts = { buffer = bufnr, silent = true }

	vim.keymap.set(
		{ "n", "i" },
		"<M-o>",
		"<cmd>MDListItemBelow<CR>",
		vim.tbl_extend("force", opts, {
			desc = "Add list item below",
		})
	)
	vim.keymap.set(
		{ "n", "i" },
		"<M-O>",
		"<cmd>MDListItemAbove<CR>",
		vim.tbl_extend("force", opts, {
			desc = "Add list item above",
		})
	)
	vim.keymap.set(
		"n",
		"<leader>mt",
		"<cmd>MDTaskToggle<CR>",
		vim.tbl_extend("force", opts, {
			desc = "Toggle task item",
		})
	)
	vim.keymap.set(
		"x",
		"<leader>mt",
		":MDTaskToggle<CR>",
		vim.tbl_extend("force", opts, {
			desc = "Toggle task items",
		})
	)
end

return M
