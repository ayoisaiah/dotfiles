local cmd = vim.api.nvim_command

-- #VIM-PANDOC-SYNTAX
cmd([[
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
]])
