local M = {}

M.ensure_installed = {
	"bash",
	"comment",
	"css",
	"csv",
	"diff",
	"dockerfile",
	"fish",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"gpg",
	"html",
	"http",
	"java",
	"javascript",
	"json",
	"json5",
	"jq",
	"kdl",
	"lua",
	"markdown",
	"markdown_inline",
	"nginx",
	"python",
	"pug",
	"powershell",
	"promql",
	"regex",
	"ruby",
	"rust",
	"sql",
	"scss",
	"ssh_config",
	"tmux",
	"toml",
	"typescript",
	"vrl",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
}

M.opts = {
	install_dir = vim.fn.stdpath("data") .. "/site",
}

function M.setup()
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
		callback = function()
			if pcall(vim.treesitter.start) then
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end,
		desc = "Enable Tree-sitter highlighting and indentation",
	})
end

return M
