---@diagnostic disable: undefined-global
local codeBlock = s(
	"c",
	fmt(
		[[
```{}
{}
```{}
]],
		{ i(1, "command"), i(2), i(3) }
	)
)

local codeBlockWithLabel = s(
	"cl",
	fmt(
		[[
```{}
[label {}]
{}
```{}
]],
		{
			c(1, { t("text"), t("go"), t("javascript"), t("json"), t("php"), t("python") }),
			i(2, "file.txt"),
			i(3),
			i(4),
		}
	)
)

local codeBlockOutput = s(
	"ci",
	fmt(
		[[
```{}
[output]
{}
```{}
]],
		{ i(1, "text"), i(2), i(3) }
	)
)

local anchorTag = s("lnk", fmt("[{}]({})", { i(1, "text"), i(2, "http://localhost:3000") }))
local image = s("img", fmt("![{}]({})", { i(1, "alt"), i(2, "todo.png") }))
local bold = s("**", fmt("**{}**", { i(1, "text") }))
local italic = s("__", fmt("_{}_", { i(1, "text") }))
local strikethrough = s("~~", fmt("~{}~", { i(1, "text") }))

local snippets = {
	codeBlock,
	codeBlockWithLabel,
	codeBlockOutput,
}

local autosnippets = {
	anchorTag,
	image,
	bold,
	italic,
	strikethrough,
}

return snippets, autosnippets
