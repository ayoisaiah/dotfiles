local map = vim.api.nvim_set_keymap
local cmd = vim.api.nvim_command

cmd([[
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
]])

-- Scroll the popup up menu
map('n', ']z', ':call coc#float#scroll(1)<cr>', { noremap = true, silent = true })
map('n', '[z', ':call coc#float#scroll(0)<cr>', { noremap = true, silent = true })

-- Use `[c` and `]c` to navigate diagnostics
map('n', ']c', '<Plug>(coc-diagnostic-next)', {})
map('n', '[c', '<Plug>(coc-diagnostic-prev)', {})

-- Hide floating windows
map('n', '<leader>fh', '<Plug>(coc-float-hid)', {})

-- Show documentation in preview window
local e = vim.api.nvim_eval
function _G.show_coc_documentation()
	local filetype = vim.bo.filetype

	if filetype == 'vim' or filetype == 'help' then
		local cword = e('expand("<cword>")')
		vim.cmd('help ' .. cword)
	elseif e('coc#rpc#ready()') > 0 then
		e("CocActionAsync('doHover')")
	else
		-- following will run "man" in vim
		local keywordprg = vim.o.keywordprg
		local cword = e('expand("<cword>")')
		vim.cmd(string.format('%s %s', keywordprg, cword))
	end
end
map('n', '<leader>k', '<cmd>lua show_coc_documentation()<cr>', {})

-- Remap keys for gotos
map('n', 'gr', '<Plug>(coc-references)', {})
map('n', 'gi', '<Plug>(coc-implementation)', {})
map('n', 'gd', '<Plug>(coc-definition)', {})
map('n', 'gy', '<Plug>(coc-type-definition)', {})

-- Remap for rename current word
map('n', '<leader>rn', '<Plug>(coc-rename)', {})

-- Close all floating windows if any
map('n', '<Esc>', ':call coc#float#close_all() <CR>', { noremap = true, silent = true })
