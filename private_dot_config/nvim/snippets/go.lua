---@diagnostic disable: undefined-global

local errCheck = s(
	"ife",
	fmt(
		[[
if err != nil {{
  return {}
}}{}
]],
		{
			i(1, "err"),
			i(2),
		}
	)
)

local print = s("fl", fmt("fmt.Println({}){}", { i(1, "args"), i(2) }))
local deepPrint = s("fst", fmt('fmt.Printf("%+v\\n", {}){}', { i(1, "args"), i(2) }))
local quotePrint = s("fq", fmt('fmt.Printf("%+q\\n", {}){}', { i(1, "args"), i(2) }))

local snippets = {
	print,
	deepPrint,
	quotePrint,
}
local autosnippets = {
	errCheck,
}

return snippets, autosnippets
