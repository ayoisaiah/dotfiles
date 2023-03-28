local config = function()
	vim.g.rooter_patterns = { "!^package.json", ".git" }
end

return {
	"airblade/vim-rooter",
	config = config,
}
