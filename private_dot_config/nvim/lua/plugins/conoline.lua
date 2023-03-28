-- TODO: Replace with Lua-based plugin
return {
  "miyakogi/conoline.vim",
  lazy = true,
	event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.g.conoline_auto_enable = 1
    vim.g.conoline_use_colorscheme_default_normal = 1
  end
}
