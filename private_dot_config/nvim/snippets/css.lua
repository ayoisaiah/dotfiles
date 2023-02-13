---@diagnostic disable: undefined-global

local subtitleComment = s(
	"stc",
	fmt(
		[[
/* {}
   ========================================================================== */
{}
]],
		{ i(1, "Subtitle"), i(2) }
	)
)

local snippets = {
	subtitleComment,
}
local autosnippets = {}

return snippets, autosnippets
