---@diagnostic disable: undefined-global

local errCheck = s(
	"ife",
	fmt(
		[[
if err != nil {{
  {}
}}{}
]],
		{
			c(1, { t("return err"), t("return nil, err"), t("t.Fatal(err)"), t("log.Fatal(err)") }),
			i(0),
		}
	)
)

local handlerFunc = s(
	"hf",
	fmt(
		[[
func {} (w http.ResponseWriter, r *http.Request) {{
  {}
}}{}
    ]],
		{
			i(1),
			i(2),
			i(0),
		}
	)
)

local testFunc = s(
	"tf",
	fmt(
		[[
func Test{} (t *testing.T) {{
  {}
}}{}
    ]],
		{
			i(1),
			i(2),
			i(0),
		}
	)
)

local testHelper = s(
	"th",
	fmt(
		[[
func {}(t *testing.T) {{
  t.Helper(){}
}}{}
    ]],
		{
			i(1),
			i(2),
			i(0),
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
	testFunc,
	testHelper,
	handlerFunc,
}

local autosnippets = {
	errCheck,
}

return snippets, autosnippets
