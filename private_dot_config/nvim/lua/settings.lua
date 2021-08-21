-- # ALIASES
local g = vim.g
local o = vim.opt
local cmd = vim.api.nvim_command

-- More natural split opening.
o.splitbelow = true
o.splitright = true

o.showcmd = true -- Show leader key

-- Tabs behaviour
o.expandtab = true -- On pressing tab, insert 2 spaces
o.tabstop = 2 -- show existing tab with 2 spaces width
o.softtabstop = 2
o.shiftwidth = 2 -- when indenting with '>', use 2 spaces width

-- Toggle Hybrid Numbers in insert and normal mode
o.relativenumber = true
o.number = true -- Show line numbers

g.noswapfile = true -- No swap file
g.nobackup = true
g.nowritebackup = true

o.textwidth = 80
o.formatoptions = o.formatoptions + 't'
o.colorcolumn = o.colorcolumn + '+1'
o.showmatch = true
o.lazyredraw = true

-- #FINDING FILES
-- Use the `:find` command to fuzzy search files in the working directory
-- The `:b` command can also be used to do the same for open buffers

-- Search all subfolders
o.path = o.path + '**'

o.termguicolors = true -- enable 24-bit TUI colours

-- Display matching files on tab complete
o.wildmenu = true

-- Ignore node_modules and images from search results
o.wildignore = o.wildignore + '**/node_modules/**,**/dist/**,**_site/**,*.swp,*.png,*.jpg,*.gif,*.webp,*webm,*.ogg,*.dng,*.jpeg,*.map,*.woff*'

-- Show Invisibles
o.list = true
o.listchars = 'tab:→→,eol:¬,space:.'

-- Automatically hide buffer with unsaved changes without showing warning
o.hidden = true

-- Treat all numbers as decimal regardless of whether they are padded with zeros
o.nrformats = ''

-- Change case sensitivity behaviour
o.ignorecase = true -- needed for smartcase to work
o.smartcase = true -- make searches case insensitive except if uppercase charater is present

o.updatetime = 100

o.complete = o.complete + 'kspell' -- Enable word completion

o.shell = '/usr/bin/bash'
g['$SHELL'] = '/usr/bin/bash'

g.loaded_matchit = 1 -- Disable matchit plugin

-- Disable Netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Disable python2 provider
g.loaded_python_provider = 0
g.python_host_prog = ''

cmd([[
" Templates
" Prefill new files created by vim with contents from the following templates
augroup templates
  autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
  autocmd BufNewFile *.scss 0r ~/.config/nvim/templates/skeleton.scss
  autocmd BufNewFile *.css 0r ~/.config/nvim/templates/skeleton.scss
  autocmd BufNewFile *.rs 0r ~/.config/nvim/templates/skeleton.rs
  autocmd BufNewFile LICENCE 0r ~/.config/nvim/templates/skeleton.LICENCE
  autocmd BufNewFile LICENSE 0r ~/.config/nvim/templates/skeleton.LICENCE
  autocmd BufNewFile .gitignore 0r ~/.config/nvim/templates/skeleton.gitignore
  autocmd BufNewFile .stylelintrc.json 0r ~/.config/nvim/templates/skeleton.stylelintrc
  autocmd BufNewFile .eslintrc.json 0r ~/.config/nvim/templates/skeleton.eslintrc
  autocmd BufNewFile .prettierrc.json 0r ~/.config/nvim/templates/skeleton.prettierrc
augroup END

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Strip trailing whitespace from all files
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e

" Automatically remove the preview window after autocompletion
autocmd CompleteDone * pclose

au BufRead,BufNewFile,BufReadPost *.json set syntax=json

" Spell checking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" Auto update dotfiles
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %
]])
