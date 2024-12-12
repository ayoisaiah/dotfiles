local config = function()
	local wk = require("which-key")
  local gs = require('gitsigns')

	gs.setup({
		on_attach = function()

			wk.register({
				name = "Git",
				["]"] = {
					name = "next",
					h = {
						function()
							if vim.wo.diff then
								return "]h"
							end
							vim.schedule(function()
								gs.next_hunk()
							end)
							return "<Ignore>"
						end,
						"Next hunk",
					},
				},
				["["] = {
					name = "previous",
					h = {
						function()
							if vim.wo.diff then
								return "[h"
							end
							vim.schedule(function()
								gs.prev_hunk()
							end)
							return "<Ignore>"
						end,
						"Previous hunk",
					},
				},
			}, {
				expr = true,
			})

			wk.register({
				name = "Git",
				b = {
					function()
						gs.blame_line({ full = true })
					end,
					"Blame line",
				},
				d = { gs.diffthis, "Diff current file" },
				s = { gs.stage_hunk, "Stage hunk" },
				S = { gs.undo_stage_hunk, "Undo stage hunk" },
				p = { gs.preview_hunk, "Preview hunk" },
				r = { gs.reset_hunk, "Reset hunk" },
				w = { gs.stage_buffer, "Stage buffer" },
				W = { gs.reset_buffer, "Reset stage buffer" },
			}, { prefix = "<leader>g" })

			wk.register({
				name = "Git",
				s = {
					function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
					"Stage hunk",
				},
				r = {
					function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
					"Reset hunk",
				},
			}, { prefix = "<leader>g", mode = "v" })
		end,
	})
end

return {
	"lewis6991/gitsigns.nvim",
	config = config,
	event = { "BufReadPost" },
}
