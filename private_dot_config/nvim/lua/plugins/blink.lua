return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"folke/lazydev.nvim",
	},
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			menu = { border = "rounded" },
			documentation = {
				auto_show = true,
				window = { border = "rounded" },
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		snippets = { preset = "luasnip" },
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},
	},
	event = "VimEnter",
}
