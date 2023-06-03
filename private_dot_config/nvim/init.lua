-- All non-plugin Neovim options
require("settings")
-- auto commands
require("autocmds")
-- Mappings not related to any plugin
require("mappings")
-- Custom functions
require("functions")
-- Plugin config and plugin-specific mappings
-- require("plugins")
-- Appearance
-- require("theme")

local fn = vim.fn
local opt = vim.opt

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})
