local map = vim.api.nvim_set_keymap
local g = vim.g
local cmd = vim.api.nvim_command

-- #COC
cmd([[
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
]])

-- Use `[c` and `]c` to navigate diagnosticsU
map('n', ']c', '<Plug>(coc-diagnostic-next)', { noremap = true, silent = true })
map('n', '[c', '<Plug>(coc-diagnostic-prev)', { noremap = true, silent = true })

-- Hide floating windows
map('n', '<leader>fh', '<Plug>(coc-float-hid)', { noremap = true, silent = true })

-- Show documentation in preview window
map('n', 'K', '<Plug>(coc-float-hid)', { noremap = true, silent = true })

-- Remap keys for gotos
map('n', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })
map('n', 'gi', '<Plug>(coc-implementation)', { noremap = true, silent = true })
map('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
map('n', 'gy', '<Plug>(coc-type-definition)', { noremap = true, silent = true })

-- Remap for rename current word
map('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = true })

-- Scroll the popup up menu
-- map('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"', { noremap = true, silent = true, nowait = true, expr = true })
-- map('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"', { noremap = true, silent = true, nowait = true, expr = true })
-- map('i', '<C-f>', 'coc#float#has_scroll() ? "\<c-r>-coc#float#scroll(1)\<cr>" : "\<Right>"', { noremap = true, silent = true, nowait = true, expr = true })
-- map('i', '<C-b>', 'coc#float#has_scroll() ? "\<c-r>-coc#float#scroll(0)\<cr>" : "\<Left>"', { noremap = true, silent = true, nowait = true, expr = true })

-- Close all floating windows if any
map('n', '<Esc>', ':call coc#float#close_all() <CR>', { noremap = true, silent = true })

-- #EMMET
g.user_emmet_install_global = 1
map('i', '<C-e>', 'emmet#expandAbbrIntelligent("<tab>")', { expr = true })

-- #CONOLINE
g.conoline_auto_enable = 1
g.conoline_use_colorscheme_default_normal=1

-- #SUPERTAB
g.SuperTabDefaultCompletionType = '<c-n>'
g.SuperTabClosePreviewOnPopupClose = 1
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<C-x><C-o>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})

-- #ULTILSNIPS
g.UltiSnipsExpandTrigger = '<c-s>'
g.UltiSnipsJumpForwardTrigger ='<c-b>'
g.UltiSnipsJumpBackwardTrigger ='<c-z>'
g.UltiSnipsSnippetsDir = '~/.config/nvim/snips'

-- #GUTENTAGS
g.gutentags_file_list_command = 'rg --files --follow --ignore-file "/home/ayo/.vimignore"'

-- #VIM-FUGITIVE
map('n', '<leader>gw', ':Gwrite<CR>', { noremap = true, silent = true })
map('n', '<leader>gc', ':Git commit --verbose<CR>', { noremap = true, silent = true })
map('n', '<leader>ga', ':Git commit --amend<CR>', { noremap = true, silent = true })

-- #RAINBOW
g.rainbow_active = 1

-- #VIM-BBYE
map('n', '<leader>qw', ':Bwipeout<CR>', { noremap = true, silent = true })

-- #VIM-MARKDOWN
-- disable header folding
g.vim_markdown_folding_disabled = 1

-- do not use conceal feature, provided by vim-pandoc-syntax
g.vim_markdown_conceal = 0

-- disable math tex conceal feature
g.tex_conceal = ''
g.vim_markdown_math = 1

-- support front matter
g.vim_markdown_frontmatter = 1  -- for YAML format

-- #VIM-QF
-- Jump to and from location/quickfix windows.
map('n', '<leader>qf', '<Plug>(qf_qf_switch)', {})

-- Toggle the quickfix list window
map('n', '<leader>qq', '<Plug>(qf_qf_toggle)', {})

-- Toggle the location list window
map('n', '<leader>ql', '<Plug>(qf_loc_toggle)', {})


-- #TELESCOPE
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
      '.webm',
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

map('n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
map('n', '<leader>tg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })
map('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
map('n', '<leader>th', '<cmd>lua require("telescope.builtin").help_tags()<CR>', { noremap = true, silent = true })
map('n', '<leader>T', '<cmd>lua require("telescope.builtin").tags()<CR>', { noremap = true, silent = true })
map('n', '<leader>ts', '<cmd>lua require("telescope.builtin").spell_suggest()<CR>', { noremap = true, silent = true })
map('n', '<leader>tt', '<cmd>lua require("telescope.builtin").current_buffer_tags()<CR>', { noremap = true, silent = true })
map('n', '<leader>tf', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', { noremap = true, silent = true })
map('n', '<leader>tc', '<cmd>lua require("telescope.builtin").commands()<CR>', { noremap = true, silent = true })
map('n', '<leader>t:', '<cmd>lua require("telescope.builtin").command_history()<CR>', { noremap = true, silent = true })
map('n', '<leader>t/', '<cmd>lua require("telescope.builtin").search_history()<CR>', { noremap = true, silent = true })
map('n', '<leader>to', '<cmd>lua require("telescope.builtin").oldfiles()<CR>', { noremap = true, silent = true })
map('n', '<leader>tq', '<cmd>lua require("telescope.builtin").quickfix()<CR>', { noremap = true, silent = true })
map('n', '<leader>tl', '<cmd>lua require("telescope.builtin").loclist()<CR>', { noremap = true, silent = true })
map('n', '<leader>th', '<cmd>lua require("telescope.builtin").highlights()<CR>', { noremap = true, silent = true })
map('n', '<leader>tr', '<cmd>lua require("telescope.builtin").registers()<CR>', { noremap = true, silent = true })
map('n', '<leader>ti', '<cmd>lua require("telescope.builtin").treesitter()<CR>', { noremap = true, silent = true })
map('n', '<leader>tcd', ':Telescope coc diagnostics<CR>', { noremap = true, silent = true })
map('n', '<leader>tcr', ':Telescope coc references<CR>', { noremap = true, silent = true })
map('n', '<leader>tu', ':Telescope ultisnips<CR>', { noremap = true, silent = true })

-- #TREESITTER
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'javascript', 'go', 'typescript', 'lua', 'dockerfile', 'c', 'bash', 'fish', 'gomod', 'css', 'html', 'json', 'rust', 'toml', 'yaml', 'tsx', 'regex', 'scss', 'vim', 'zig', 'ruby'},
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

-- #NVIM-BUFFERLINE
require("bufferline").setup{}
map('n', '<leader>gb', ':BufferLinePick<CR>', { noremap = true, silent = true })
map('n', '<leader>gc', ':BufferLinePickClose<CR>', { noremap = true, silent = true })

-- #INDENT BLANKLINE
require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}

-- #NVIM-BASE16
local base16 = require 'base16'
-- base16(base16.themes["outrun-dark"], true)
local hardcore = base16.theme_from_array {
	"1d2021"; "303030"; "353535"; "4A4A4A";
	"707070"; "cdcdcd"; "e5e5e5"; "ffffff";
	"fb4934"; "fd971f"; "e6db74"; "a6e22e";
	"708387"; "66d9ef"; "9e6ffe"; "e8b882";
}
base16(hardcore, true)

-- #NVIM-AUTOPAIRS
require('nvim-autopairs').setup{}

-- #NEOSCROLL
require('neoscroll').setup()

-- #NVIM-COMMENT
require('nvim_comment').setup()

-- # GITSIGNS
require('gitsigns').setup {
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]h'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [h'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
  },
}

-- #VIM-PANDOC-SYNTAX
cmd([[
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
]])
