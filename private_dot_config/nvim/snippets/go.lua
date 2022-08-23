return {
	s("fl", fmt("fmt.Println({}){}", { i(1, "args"), i(2) })),
	s("fst", fmt('fmt.Printf("%+v\\n", {}){}', { i(1, "args"), i(2) })),
	-- s("ife", fmt("if err != nil \\{\n\t{}\\}{}", { i(1, "error handling"), i(2) })),
}
