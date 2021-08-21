" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=/home/ayo/.cache/dein/repos/github.com/Shougo/dein.vim

" #PLUGINS {{{
call dein#begin('~/.cache/dein')
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('wsdjeg/dein-ui.vim')

" Markdown
call dein#add('plasticboy/vim-markdown')
call dein#add('vim-pandoc/vim-pandoc-syntax')

" Fuzzy searching
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

call dein#add('nvim-lua/plenary.nvim')
call dein#add('nvim-telescope/telescope.nvim')
call dein#add('fannheyward/telescope-coc.nvim')
call dein#add('fhill2/telescope-ultisnips.nvim')

" Git
call dein#add('tpope/vim-fugitive') " Git wrapper for vim
call dein#add('lewis6991/gitsigns.nvim') " Git signs
call dein#add('rhysd/git-messenger.vim') " Show Git info in a popup

" Appearance and themes
call dein#add('itchyny/lightline.vim') " Status line customisation
call dein#add('kyazdani42/nvim-web-devicons') " Dev icons
call dein#add('akinsho/nvim-bufferline.lua')
call dein#add('lukas-reineke/indent-blankline.nvim')
call dein#add('norcalli/nvim-base16.lua')

" Autocompletion, formatting, linting & intellisense
call dein#add('neoclide/coc.nvim', {'merged': '0'}) " IDE-like features
call dein#add('neoclide/coc-prettier', { 'merged': 0, 'build': 'yarn install --frozen-lockfile' })
call dein#add('SirVer/ultisnips') " Snippets

" Utilities
call dein#add('romainl/vim-qf') " Quick fix settings, commands and mappings
call dein#add('moll/vim-bbye') " Delete buffers without closing windows
call dein#add('windwp/nvim-autopairs') " Insert or delete brackets, parens, quotes in pair.
call dein#add('mattn/emmet-vim') " Makes writing HTML and CSS much easier
call dein#add('ervandew/supertab') " Use <Tab> for autocompletion in insert mode
call dein#add('tpope/vim-surround') " Mappings for surroundings like brackets, quotes, e.t.c.
call dein#add('terrortylor/nvim-comment') " Comment stuff out easily
call dein#add('tpope/vim-repeat') " Enhance the dot command
call dein#add('tpope/vim-unimpaired') " Custom mappings for some ex commands
call dein#add('luochen1990/rainbow') " Use different colours for parenthesis levels
call dein#add('ludovicchabant/vim-gutentags') " Manage tag files automatically
call dein#add('wakatime/vim-wakatime') " Auto generated metrics and time tracking
call dein#add('miyakogi/conoline.vim') " Highlight the line of the cusor in the current window
call dein#add('airblade/vim-rooter') " Change vim working directory to project directory
call dein#add('karb94/neoscroll.nvim') " Smooth scrolling
call dein#add('andymass/vim-matchup') " Highlight, navigate, and operate on sets of matching text

" Treesitter
call dein#add('nvim-treesitter/nvim-treesitter', {'merged': 0})
call dein#add('nvim-treesitter/nvim-treesitter-textobjects')

call dein#end()

if dein#check_install()
 call dein#install()
endif
"}}}
