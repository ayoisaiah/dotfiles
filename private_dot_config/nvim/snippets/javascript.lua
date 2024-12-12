---@diagnostic disable: undefined-global
local consoleLog = s("clg", fmt([[console.log({})]], { i(1) }))
-- local import = s("imp", fmt([[import ]]))
-- local callback = s(
-- 	"cb",
-- 	fmt([[({}) => {
--   {}
-- }]]),
-- 	i(1),
-- 	i(2)
-- )

local snippets = {
	-- callback,
}
local autosnippets = {
	consoleLog,
}

return snippets, autosnippets
