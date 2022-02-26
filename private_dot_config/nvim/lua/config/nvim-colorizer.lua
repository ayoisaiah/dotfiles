vim.cmd([[ packadd nvim-colorizer.lua ]])
require("colorizer").setup({
	"css",
	"javascript",
	"html",
	"scss",
	"lua",
})
