local config = function()
	local ls = require("luasnip")

	ls.config.set_config({
		history = true,
		update_events = "TextChanged,TextChangedI",
		enable_autosnippets = true,
		ext_opts = {
			[require("luasnip.util.types").choiceNode] = {
				active = {
					virt_text = {
						{
							"🔀",
						},
					},
				},
			},
		},
	})

	require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

	vim.keymap.set({ "i", "s" }, "<C-k>", function()
		if ls.jumpable(1) then
			ls.jump(1)
		end
	end, { silent = true })

	vim.keymap.set({ "i", "s" }, "<C-j>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, { silent = true })

	vim.keymap.set("i", "<C-l>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end, { silent = true })

	vim.keymap.set("i", "<C-L>", function()
		if ls.choice_active() then
			ls.change_choice(-1)
		end
	end, { silent = true })

	-- reload luasnips file which reloads snippets
	vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>")
end

return {
	"L3MON4D3/LuaSnip",
	config = config,
	event = "BufEnter",
}
