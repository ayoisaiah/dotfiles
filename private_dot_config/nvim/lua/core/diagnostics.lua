vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = { source = "always", border = "rounded" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "❌",
			[vim.diagnostic.severity.WARN] = "⚠️",
			[vim.diagnostic.severity.HINT] = "🟢",
			[vim.diagnostic.severity.INFO] = "ℹ️",
		},
	},
})
