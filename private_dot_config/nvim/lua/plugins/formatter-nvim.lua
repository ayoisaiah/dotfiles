require('formatter').setup({
  filetype = {
    javascript = {
      function()
        return {
          exe = "prettier",
          stdin = true
        }
      end
    },
    go = {
      function()
        return {
          exe = "goimports",
          stdin = true
        }
      end
    }
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.go FormatWrite
augroup END
]], true)
