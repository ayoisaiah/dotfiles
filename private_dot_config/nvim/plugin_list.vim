" #PLUGINS {{{
call plug#begin('~/.local/share/nvim/plugged')

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Fuzzy searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive' " Git wrapper for vim
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim' " Show Git info in a popup

" Appearance and themes
Plug 'ghifarit53/tokyonight-vim' " Colour scheme
Plug 'itchyny/lightline.vim' " Status line customisation
Plug 'ryanoasis/vim-devicons' " Adds file type icons to Vim plugins

" Autocompletion, formatting, linting & intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'} " IDE-like features
Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' }
Plug 'SirVer/ultisnips' " Snippets

" Utilities
Plug 'romainl/vim-qf' " Quick fix settings, commands and mappings
Plug 'airblade/vim-rooter' " Change vim working directory to project directory
Plug 'moll/vim-bbye' " Delete buffers without closing windows
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'mattn/emmet-vim' " Makes writing HTML and CSS much easier
Plug 'ervandew/supertab' " Use <Tab> for autocompletion in insert mode
Plug 'tpope/vim-surround' " Mappings for surroundings like brackets, quotes, e.t.c.
Plug 'tpope/vim-commentary' " Comment stuff out easily
Plug 'tpope/vim-repeat' " Enhance the dot command
Plug 'tpope/vim-unimpaired' " Custom mappings for some ex commands
Plug 'luochen1990/rainbow' " Use different colours for parenthesis levels
Plug 'ludovicchabant/vim-gutentags' " Manage tag files automatically
Plug 'wakatime/vim-wakatime' " Auto generated metrics and time tracking
Plug 'miyakogi/conoline.vim' " Highlight the line of the cusor in the current window

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
"}}}
