return {
	s("c", fmt("```{}\n{}```{}", { i(1, "command"), i(2), i(3) })),
	s("lnk", fmt("[{}]({})", { i(1, "text"), i(2, "url") })),
}
