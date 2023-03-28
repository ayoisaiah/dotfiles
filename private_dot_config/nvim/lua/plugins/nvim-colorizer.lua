return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
      "html", "css", "scss", "javascript", "lua", "eruby",
    })
	end,
	ft = { "html", "css", "scss", "javascript", "lua", "eruby" },
}
