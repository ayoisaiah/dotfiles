local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	---@diagnostic disable-next-line: lowercase-global
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Auto compile when there are changes in lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua source <afile> | PackerCompile
  augroup end
]])

require("packer").startup(function(use)
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })

	-- Telescope for fuzzy search
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})
	use({ "natecraddock/telescope-zf-native.nvim" })

	-- Git
	use({ "tpope/vim-fugitive" }) -- Git wrapper for vim
	use({ "lewis6991/gitsigns.nvim" }) -- Git signs
	use({ "rhysd/git-messenger.vim", event = "VimEnter" }) -- Show Git info in a popup
	use({
		"pwntester/octo.nvim", -- GitHub integration. Requires Github CLI and plugins below
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- Appearance and themes
	use({ "hoob3rt/lualine.nvim" }) -- Statusline
	use({ "kyazdani42/nvim-web-devicons" }) -- Dev icons
	use({ "akinsho/nvim-bufferline.lua" }) -- Better nvim buffers
	use({ "lukas-reineke/indent-blankline.nvim" }) -- Indenting
	use({ "rebelot/kanagawa.nvim" }) -- Colour scheme

	-- Autocompletion, formatting, linting & intellisense
	use({ "neovim/nvim-lspconfig" })
	use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" }) -- LSP Lines
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
			{ "ray-x/lsp_signature.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
	})
	use({ "L3MON4D3/LuaSnip" }) -- Snippets
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- Linting, formatting, and diagnostics
	use({
		"hrsh7th/nvim-cmp", -- Auto completions from various sources
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "andersevenrud/cmp-tmux" },
			{ "onsails/lspkind.nvim" },
			{ "f3fora/cmp-spell" },
		},
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
	})

	-- Utilities
	use({ "romainl/vim-qf" }) -- Quick fix settings, commands and mappings
	use({ "moll/vim-bbye" }) -- Delete buffers without closing windows
	use({ "windwp/nvim-autopairs" }) -- Insert or delete brackets, parens, quotes in pair.
	use({ "mattn/emmet-vim", event = "VimEnter", ft = { "html", "markdown", "css", "scss" } }) -- Shortcuts for writing HTML and CSS
	use({ "norcalli/nvim-colorizer.lua", ft = { "html", "css", "scss", "javascript", "lua" } }) -- Colour highlighting
	use({ "kylechui/nvim-surround" }) -- Mappings for surroundings like brackets, quotes, e.t.c.
	use({ "numtostr/comment.nvim" }) -- Comment stuff out easily
	use({ "tpope/vim-repeat" }) -- Enhance the dot command
	use({ "godlygeek/tabular" }) -- Text alignment
	use({ "tpope/vim-unimpaired" }) -- Custom mappings for some ex commands
	use({ "p00f/nvim-ts-rainbow" }) -- Use different colours for parenthesis levels

	use({ "ludovicchabant/vim-gutentags" }) -- Manage tag files automatically

	use({ "miyakogi/conoline.vim" }) -- Highlight the line of the cusor in the current window
	use({ "airblade/vim-rooter" }) -- Change vim working directory to project directory
	use({ "andymass/vim-matchup", event = "VimEnter" }) -- Highlight, navigate, and operate on sets of matching text
	use({ "lewis6991/impatient.nvim" }) -- Speed up startup time
	use({ "folke/todo-comments.nvim" }) -- Highlight and search for TODO comments
	use({ "folke/trouble.nvim" }) -- Diagnostics
	use({ "folke/which-key.nvim" }) -- Key bindings
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" }) -- Makes using the built-in terminal much easier

	if packer_bootstrap then
		require("packer").sync()
	end
end)

-- Plugin config
require("config/conoline")
require("config/emmet-vim")
require("config/gitsigns")
require("config/indent-blankline")
require("config/lualine")
require("config/nvim-autopairs")
require("config/nvim-bufferline")
require("config/nvim-lspconfig")
require("config/null-ls")
require("config/comment")
require("config/nvim-ts-rainbow")
require("config/telescope")
require("config/nvim-surround")
require("config/vim-bbye")
require("config/vim-fugitive")
require("config/vim-qf")
require("config/vim-rooter")
require("config/todo-comments")
require("config/trouble")
require("config/which-key")
require("config/navigator")
require("config/octo")
require("config/lsp_signature")
require("config/nvim-colorizer")
require("config/vim-gutentags")
require("config/nvim-cmp")
require("config/treesitter")
require("config/toggleterm")
require("config/luasnip")
require("config/lsp_lines")
