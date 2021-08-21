" #PLUGINS AND EXTERNAL COMMANDS

" #THEME {{{
set termguicolors
set background=dark
" }}}

" #CONOLINE {{{
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1
" }}}

" #SUPERTAB {{{
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabClosePreviewOnPopupClose = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
" }}}

" #LIGHTLINE {{{
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
"}}}

" #EMMET {{{
let g:user_emmet_install_global = 1
imap <expr> <C-e> emmet#expandAbbrIntelligent("\<tab>")
"}}}

" #COC {{{
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" Use `[c` and `]c` to navigate diagnosticsU
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> [c <Plug>(coc-diagnostic-prev)

" Hide floating windows
nmap <silent> <leader>fh <Plug>(coc-float-hide)
" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)"

" Get code action for current line
nmap <leader>do <Plug>(coc-codeaction)

" Remap for format selected region
vmap <leader>fc  <Plug>(coc-format-selected)
nmap <silent> <leader>fc <Plug>(coc-format-selected)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Scroll the popup up menu
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Close all floating windows if any
nmap <silent> <Esc> :call coc#float#close_all() <CR>

" COC-SNIPPETS
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x <Plug>(coc-convert-snippet)
"}}}

" #ULTILSNIPS {{{
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories=["snips"]
"}}}

" #GUTENTAGS {{{
let g:gutentags_file_list_command = "rg --files --follow --ignore-file '/home/ayo/.vimignore'"
"}}}

" #FZF.VIM {{{
let g:fzf_command_prefix = 'Fzf'
" }}}

" {{{ #TELESCOPE
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
      '$HOME/.vimignore'
    },
    file_ignore_patterns = {
      'node_modules',
      '.ogg',
      '.git',
      'vendor',
      '.jpeg',
      '.jpg',
      '.png',
      '.mp4',
      '.mp3',
      '.ogg',
      '.webp',
      '.gif',
      '.woff*',
      '.cr2',
      '.dng',
      '.keep',
      'yarn.lock',
      'package-lock.json'
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
  },
}
require('telescope').load_extension('ultisnips')
require('telescope').load_extension('coc')
EOF

nnoremap <silent> <c-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>gt <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>T <cmd>lua require('telescope.builtin').tags()<cr>
nnoremap <leader>S <cmd>lua require('telescope.builtin').spell_suggest()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').current_buffer_tags()<cr>
nnoremap <leader>fp <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>c: <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>: <cmd>lua require('telescope.builtin').command_history()<cr>
nnoremap <leader>/ <cmd>lua require('telescope.builtin').search_history()<cr>
nnoremap <leader>o <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>Q <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>l <cmd>lua require('telescope.builtin').loclist()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').highlights()<cr>
nnoremap <leader>" <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader>i <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <silent> <leader>cd :Telescope coc diagnostics<cr>
nnoremap <silent> <leader>cr :Telescope coc references<cr>
nnoremap <silent> <leader>u :Telescope ultisnips<cr>
" }}}

" #VIM-FUGITIVE {{{
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>gc :Git commit --verbose --quiet<CR>
nmap <silent> <leader>ga :Git commit --amend<CR>
nmap <silent> <leader>gs :Git<CR>
nmap <silent> <leader>gl :Gclog<CR>
"}}}

" RAINBOW {{{
let g:rainbow_active = 1
"}}}

" VIM-BBYE {{{
" Delete buffer completely without messing up window layout
nnoremap <leader>q :Bwipeout<CR>
" }}}

" VIM-PANDOC-SYNTAX {{{
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
"}}}

" VIM-MARKDOWN {{{
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, provided by vim-pandoc-syntax
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter
let g:vim_markdown_frontmatter = 1  " for YAML format
" }}}

" VIM-QF {{{
" Jump to and from location/quickfix windows.
nmap <leader>l <Plug>(qf_qf_switch)

" Toggle the quickfix list window
nmap <F5> <Plug>(qf_qf_toggle)

" Toggle the location list window
nmap <F6> <Plug>(qf_loc_toggle)
"}}}

" #RIPGREP {{{
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}

" {{{ #TREESITTER
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  matchup = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
EOF
" }}}

" {{{ #NVIM-BUFFERLINE
lua << EOF
require("bufferline").setup{}
EOF
nnoremap <silent> <leader>gb :BufferLinePick<CR>
nnoremap <silent> <leader>gc :BufferLinePickClose<CR>
" }}}

" {{{ #INDENT BLANKLINE
lua << EOF
require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}
EOF
" }}}

" {{{ #BASE-16
lua << EOF
local base16 = require 'base16'
-- base16(base16.themes["outrun-dark"], true)
local hardcore = base16.theme_from_array {
	"1d2021"; "303030"; "353535"; "4A4A4A";
	"707070"; "cdcdcd"; "e5e5e5"; "ffffff";
	"fb4934"; "fd971f"; "e6db74"; "a6e22e";
	"708387"; "66d9ef"; "9e6ffe"; "e8b882";
}
base16(hardcore, true)
EOF
" }}}

" {{{ #NVIM-AUTOPAIRS
lua << EOF
require('nvim-autopairs').setup{}
EOF
" }}}

" {{{ #NEOSCROLL
lua << EOF
require('neoscroll').setup()
EOF
" }}}

" {{{ #NVIM-COMMENT
lua << EOF
require('nvim_comment').setup()
EOF
" }}}

" {{{ #GITSIGNS
lua << EOF
require('gitsigns').setup {
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]h'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [h'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
  },
}
EOF
" }}}

