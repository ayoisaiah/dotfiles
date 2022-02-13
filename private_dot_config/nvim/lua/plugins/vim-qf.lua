local wk = require("which-key")

wk.register({
	name = "diagnostics",
	f = { "<Plug>(qf_qf_switch)", "Jump to and from quickfix/location window" },
	q = { "<Plug>(qf_qf_toggle)", "Toggle quickfix" },
	l = { "<Plug>(qf_loc_toggle)", "Toggle loclist" },
}, { prefix = "<leader>q" })
