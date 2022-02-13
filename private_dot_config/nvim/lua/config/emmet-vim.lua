vim.g.user_emmet_install_global = 1
vim.api.nvim_set_keymap("i", "<C-e>", 'emmet#expandAbbrIntelligent("<tab>")', { expr = true })
