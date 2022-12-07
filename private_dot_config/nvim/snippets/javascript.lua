---@diagnostic disable: undefined-global
local consoleLog = s("clg", fmt([[console.log({})]], { i(1) }))

local snippets = {}
local autosnippets = {
	consoleLog,
}

return snippets, autosnippets
