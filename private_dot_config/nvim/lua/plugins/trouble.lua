require("trouble").setup({})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- lsp provider to find the cursor word definition and reference
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_dignostics<cr>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_dignostics<cr>", opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
map("n", "<C-n>", "require('trouble').next({skip_groups = true, jump = true});", opts)
