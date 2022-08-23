local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local types = require("luasnip.util.types")
local wk = require("which-key")

ls.config.set_config({
	history = true,
	update_events = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

-- ls.add_snippets("go", {
-- 	snip({
-- 		trig = "fh",
-- 		name = "Handler Func",
-- 		dscr = "Go HTTP Handler function",
-- 	}, {
-- 		text("func "),
-- 		insert(1, "name"),
-- 		text("(w http.ResponseWriter, r *http.Request) {"),
-- 		insert(2, "body"),
-- 		text("}"),
-- 		insert(0),
-- 	}),
-- })

-- function _expand()
-- 	if ls.expand_or_jumpable() then
-- 		ls.expand_or_jumpable()
-- 	end
-- end

-- wk.register({
-- 	name = "luasnip",
-- 	"<C-9>" = { "<cmd>lua _expand()<CR>", "Expand lua snippet" },
-- }, {
-- 	mode = "i",
-- })

-- map("i", "<C-s>", "<cmd")

-- vim.keymap.set({ "i", "s" }, "<C-s>", end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-v>", function()
	if ls.jumpable(-1) then
		ls.jumpable(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- reload luasnips file which reloads snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/config/luasnip.lua<CR>")
