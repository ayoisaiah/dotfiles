local config = function()
	local cmp = require("cmp")
	local lspconfig = require("lspconfig")
	local lspkind = require("lspkind")
	local luasnip = require("luasnip")
	local compare = require("cmp.config.compare")

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	cmp.setup({
		experimental = {
			ghost_text = true,
		},
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol",
				menu = {
					fuzzy_buffer = "[BUF]",
					nvim_lsp = "[LSP]",
					async_path = "[PATH]",
					luasnip = "[SNIP]",
					spell = "[SPELL]",
					cmdline = "[CMD]",
					tmux = "[TMUX]",
				},
				maxwidth = 50,
			}),
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				require("cmp_fuzzy_buffer.compare"),
				compare.offset,
				compare.exact,
				compare.score,
				compare.recently_used,
				compare.kind,
				compare.sort_text,
				compare.length,
				compare.order,
			},
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = {
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
			["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = cmp.config.disable,
			["<C-e>"] = cmp.config.disable,
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		},
		sources = cmp.config.sources({
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "treesitter" },
			{ name = "async_path", option = {
				trailing_slash = true,
			} },
			-- { name = "fuzzy_buffer" },
			-- { name = "tmux", {
			-- 	option = {
			-- 		all_panes = true,
			-- 	},
			-- } },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.filetype("markdown", {
		sources = cmp.config.sources({
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "async_path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	-- Setup lspconfig.
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	local servers = { "gopls", "tsserver", "golangci_lint_ls", "lua_ls" }
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			capabilities = capabilities,
		})
	end

	if vim.o.ft == "clap_input" and vim.o.ft == "guihua" and vim.o.ft == "guihua_rust" then
		cmp.setup.buffer({ completion = { enable = false } })
	end
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "tzachar/cmp-fuzzy-buffer" },
		{ "tzachar/fuzzy.nvim" },
		{ "FelipeLema/cmp-async-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "ray-x/cmp-treesitter" },
		-- { "andersevenrud/cmp-tmux" },
		{ "onsails/lspkind.nvim" },
		-- { "f3fora/cmp-spell" },
	},
	config = config,
}
