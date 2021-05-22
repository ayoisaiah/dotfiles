" #GENERAL SETTINGS

" Disallow detection of filetypes
filetype off

filetype plugin indent on    " required
runtime macros/matchit.vim

set shell=/usr/bin/bash
let $SHELL = "/usr/bin/bash"

" Disable Netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

let loaded_matchit = 1

" Disable python2 provider
let g:loaded_python_provider = 0
let g:python_host_prog = ''

syntax enable

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

" #TEMPLATES {{{
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
"}}}

" Stop concealing quotes in JSON
let g:vim_json_syntax_conceal = 0

" Enable JSX syntax highlighting in .js files
let g:jsx_ext_required = 0

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


" More natural split opening.
set splitbelow
set splitright

" Show leader key
set showcmd

" #TABS AND SPACES {{{
set expandtab " On pressing tab, insert 2 spaces
set tabstop=2 " show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2 " when indenting with '>', use 2 spaces width
"}}}

set number " Show line numbers
set noswapfile " No swap file
set nobackup
set nowritebackup

set textwidth=80
set formatoptions+=t
set colorcolumn=+1
set showmatch
set lazyredraw

" #FINDING FILES
" Use the `:find` command to fuzzy search files in the working directory
" The `:b` command can also be used to do the same for open buffers

" Search all subfolders
set path+=**

" Display matching files on tab complete
set wildmenu

" Ignore node_modules and images from search results
set wildignore+=**/node_modules/**,**/dist/**,**_site/**,*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map

" Toggle Hybrid Numbers in insert and normal mode
:set number relativenumber

" Show Invisibles
set list
set listchars=tab:→→,eol:¬,space:.

" Automatically hide buffer with unsaved changes without showing warning
set hidden

" Treat all numbers as decimal regardless of whether they are padded with zeros
set nrformats=

" Highlight matches when using :substitute
set hlsearch

" Predicts case sensitivity intentions
set smartcase

" Jump to match when searching
set incsearch

set updatetime=100

" Enable word completion
set complete+=kspell

hi NonText guifg=#4a4a59
hi SpecialKey guifg=white guibg=#cc0000

" Strip trailing whitespace from all files
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e

" Automatically remove the preview window after autocompletion
autocmd CompleteDone * pclose

au BufRead,BufNewFile,BufReadPost *.json set syntax=json

" Spell checking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
