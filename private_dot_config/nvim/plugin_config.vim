" #PLUGINS AND EXTERNAL COMMANDS

" #THEME {{{
set termguicolors
set background=dark
let g:tokyonight_style = 'night' " available: night, storm, day
colorscheme tokyonight
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
      \ 'colorscheme': 'tokyonight',
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

" FZF.VIM {{{
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>T :FzfTags<CR>
" }}}

" FZF-PREVIEW {{{
let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages --ignore-file "/home/ayo/.vimignore" -g \!"* *"' "
let g:fzf_preview_lines_command = 'bat --color=always --plain --number'
let g:fzf_preview_use_dev_icons = 0
let g:fzf_preview_buffers_jump = 0

let $BAT_THEME = 'gruvbox'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'gruvbox'

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> <c-p>     :<C-u>CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <silent> <leader>b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]ch    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]li     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> <leader>gt    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>.<CR>
nnoremap <silent> <leader>t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
nnoremap <silent> <leader>cd     :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>
nnoremap <silent> <leader>cc     :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> <leader>cr     :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> <leader>ct     :<C-u>CocCommand fzf-preview.CocTypeDefinitions<CR>
nnoremap <silent> [fzf-p]ga     :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
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

" #GITGUTTER {{{
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" }}}

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
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
