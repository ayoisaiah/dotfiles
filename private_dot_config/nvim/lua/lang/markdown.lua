local M = {}

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
		}, { buffer = 0 })
	end
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
