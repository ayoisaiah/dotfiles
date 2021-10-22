local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Auto compile when there are changes in plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


require('impatient')
require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Markdown
  use { 'plasticboy/vim-markdown' }
  use { 'vim-pandoc/vim-pandoc-syntax' }

  -- Telescope
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'fannheyward/telescope-coc.nvim' }
  use { 'fhill2/telescope-ultisnips.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Git
  use { 'tpope/vim-fugitive', event = 'VimEnter' } -- Git wrapper for vim
  use { 'lewis6991/gitsigns.nvim' } -- Git signs
  use { 'rhysd/git-messenger.vim', event = 'VimEnter' } -- Show Git info in a popup

  -- Appearance and themes
  use { 'hoob3rt/lualine.nvim' } -- Statusline
  use { 'kyazdani42/nvim-web-devicons' } -- Dev icons
  use { 'akinsho/nvim-bufferline.lua' } -- Better nvim buffers
  use { 'lukas-reineke/indent-blankline.nvim' } -- Indenting
  use { 'norcalli/nvim-base16.lua' } -- Theme colours

  -- Autocompletion, formatting, linting & intellisense
  use {
    'neoclide/coc.nvim', -- Intellisense, LSP and other language smarts
    run = 'yarn install --frozen-lockfile'
  }
  use { 'neoclide/coc-prettier', run = 'yarn install --frozen-lockfile' }
  use { 'SirVer/ultisnips' } -- Snippets engine

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  -- Utilities
  use { 'romainl/vim-qf' } -- Quick fix settings, commands and mappings
  use { 'moll/vim-bbye' } -- Delete buffers without closing windows
  use { 'windwp/nvim-autopairs' } -- Insert or delete brackets, parens, quotes in pair.
  use { 'mattn/emmet-vim', event = 'VimEnter', ft = {'html', 'markdown', 'css', 'scss'} } -- Shortcuts for writing HTML and CSS
  use { 'norcalli/nvim-colorizer.lua', ft = { 'html', 'css', 'scss', 'javascript' } } -- Colour highlighting
  use { 'ervandew/supertab' } -- Use <Tab> for autocompletion in insert mode
  use { 'tpope/vim-surround' } -- Mappings for surroundings like brackets, quotes, e.t.c.
  use { 'numtostr/comment.nvim' } -- Comment stuff out easily
  use { 'tpope/vim-repeat' } -- Enhance the dot command
  use { 'tpope/vim-unimpaired' } -- Custom mappings for some ex commands
  use { 'luochen1990/rainbow' } -- Use different colours for parenthesis levels
  use { 'ludovicchabant/vim-gutentags' } -- Manage tag files automatically
  use { 'wakatime/vim-wakatime', event = 'VimEnter' } -- Auto generated metrics and time tracking
  use { 'miyakogi/conoline.vim' } -- Highlight the line of the cusor in the current window
  use { 'airblade/vim-rooter' } -- Change vim working directory to project directory
  use { 'andymass/vim-matchup', event = 'VimEnter' } -- Highlight, navigate, and operate on sets of matching text
  use { 'lewis6991/impatient.nvim' } -- Speed up startup time

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Config
require('plugins.coc-nvim')
require('plugins.conoline')
require('plugins.emmet-vim')
require('plugins.gitsigns')
require('plugins.indent-blankline')
require('plugins.lualine')
require('plugins.nvim-autopairs')
require('plugins.nvim-bufferline')
require('plugins.comment')
require('plugins.rainbow')
require('plugins.supertab')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.ultisnips')
require('plugins.vim-bbye')
require('plugins.vim-fugitive')
require('plugins.vim-gutentags')
require('plugins.vim-markdown')
require('plugins.vim-pandoc')
require('plugins.vim-qf')
require('plugins.vim-rooter')
