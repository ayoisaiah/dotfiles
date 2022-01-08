require("todo-comments").setup({
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--ignore-file",
      "/home/ayo/.vimignore",
    },
  },
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- lsp provider to find the cursor word definition and reference
map("n", "<leader>td", ":TodoTelescope <CR>", opts)
