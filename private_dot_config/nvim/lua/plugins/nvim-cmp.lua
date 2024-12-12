local config = function()
	local cmp = require("cmp")
	local lspkind = require("lspkind")
	local luasnip = require("luasnip")
	local compare = require("cmp.config.compare")

	local defaultSources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "treesitter" },
		-- { name = "fuzzy_buffer" },
		-- { name = "fuzzy_path" },
	}

	local customSources = function(sources)
		local newTable = {}

		-- Copy original table
		for i, v in ipairs(defaultSources) do
			newTable[i] = v
		end

		for _, v in ipairs(sources) do
			newTable[#newTable + 1] = v
		end

		return newTable
	end

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
				mode = "text",
				menu = {
					fuzzy_buffer = "[BUF]",
					fuzzy_path = "[PATH]",
					nvim_lsp = "[LSP]",
					luasnip = "[SNIP]",
					fish = "[FISH]",
					cmdline = "[CMD]",
					-- dictionary = "[DICT]",
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
		sources = cmp.config.sources(defaultSources, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.filetype("markdown", {
		sources = cmp.config.sources(
			customSources({
				{
					name = "dictionary",
					keyword_length = 2,
				},
			}),
			{
				{ name = "buffer" },
			}
		),
	})

	cmp.setup.filetype("fish", {
		sources = cmp.config.sources(
			customSources({
				{ name = "fish" },
			}),
			{
				{ name = "buffer" },
			}
		),
	})

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{
				name = "fuzzy_path",
				option = {
					fd_cmd = { "fd", "-d", "5", "-p", "-E", "node_modules", "-E", "vendor", "--max-results", "10" },
				},
			},
		}, {
			{ name = "cmdline" },
		}),
	})
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "tzachar/fuzzy.nvim" },
		{ "tzachar/cmp-fuzzy-buffer" },
		{ "tzachar/cmp-fuzzy-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "ray-x/cmp-treesitter" },
		{ "onsails/lspkind.nvim" },
		{ "mtoohey31/cmp-fish" },
	},
	event = { "InsertEnter" },
	config = config,
}
