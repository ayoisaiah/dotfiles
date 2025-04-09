local config = function()
	local wk = require("which-key")
	local gs = require("gitsigns")

	gs.setup({
		on_attach = function()
			local nextHunk = function()
				if vim.wo.diff then
					return "]h"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end

			local prevHunk = function()
				if vim.wo.diff then
					return "[h"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end

			wk.add({
				{ "[", expr = true, group = "previous", replace_keycodes = false },
				{ "[h", prevHunk, desc = "Previous hunk", expr = true, replace_keycodes = false },
				{ "]", expr = true, group = "next", replace_keycodes = false },
				{ "]h", nextHunk, desc = "Next hunk", expr = true, replace_keycodes = false },
			})

			wk.add({
				{ "<leader>g", group = "Git" },
				{ "<leader>gS", gs.undo_stage_hunk, desc = "Undo stage hunk" },
				{ "<leader>gW", gs.reset_buffer, desc = "Reset stage buffer" },
				{
					"<leader>gb",
					function()
						gs.blame_line({ full = true })
					end,
					desc = "Blame line",
				},
				{ "<leader>gd", gs.diffthis, desc = "Diff current file" },
				{ "<leader>gp", gs.preview_hunk, desc = "Preview hunk" },
				{ "<leader>gr", gs.reset_hunk, desc = "Reset hunk" },
				{ "<leader>gs", gs.stage_hunk, desc = "Stage hunk" },
				{ "<leader>gw", gs.stage_buffer, desc = "Stage buffer" },
			})

			wk.add({
				{
					mode = { "v" },
					{ "<leader>g", group = "Git" },
					{
						"<leader>gs",
						function()
							gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
						end,
						desc = "Stage hunk",
					},
					{
						"<leader>gr",
						function()
							gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
						end,
						desc = "Reset hunk",
					},
				},
			})
		end,
	})
end

return {
	"lewis6991/gitsigns.nvim",
	config = config,
	event = { "BufReadPost" },
}
