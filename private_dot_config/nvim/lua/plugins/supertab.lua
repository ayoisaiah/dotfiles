vim.g.SuperTabDefaultCompletionType = '<c-n>'
vim.g.SuperTabClosePreviewOnPopupClose = 1

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<C-x><C-o>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
