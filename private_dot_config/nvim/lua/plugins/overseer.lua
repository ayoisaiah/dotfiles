local function restart_last_task()
	local overseer = require("overseer")
	local task_list = require("overseer.task_list")
	local tasks = overseer.list_tasks({
		status = {
			overseer.STATUS.SUCCESS,
			overseer.STATUS.FAILURE,
			overseer.STATUS.CANCELED,
		},
		sort = task_list.sort_finished_recently,
	})

	if vim.tbl_isempty(tasks) then
		vim.notify("No tasks found", vim.log.levels.WARN)
		return
	end

	overseer.run_action(tasks[1], "restart")
end

local function config()
	local overseer = require("overseer")
	local wk = require("which-key")

	overseer.setup({
		task_list = {
			direction = "bottom",
			min_height = 10,
			max_height = { 24, 0.3 },
		},
	})

	vim.api.nvim_create_user_command("OverseerRestartLast", restart_last_task, {
		desc = "Restart the most recent Overseer task",
	})

	wk.add({
		{ "<leader>t", group = "Tasks" },
		{ "<leader>ta", "<cmd>OverseerTaskAction<CR>", desc = "Task action" },
		{ "<leader>tc", "<cmd>OverseerRun<CR>", desc = "Choose task" },
		{ "<leader>tl", restart_last_task, desc = "Restart last task" },
		{ "<leader>to", "<cmd>OverseerOpen! bottom<CR>", desc = "Open task list" },
		{ "<leader>tq", "<cmd>OverseerClose<CR>", desc = "Close task list" },
		{ "<leader>tr", "<cmd>OverseerRun<CR>", desc = "Run task" },
		{ "<leader>ts", "<cmd>OverseerShell<CR>", desc = "Run shell command" },
		{ "<leader>tt", "<cmd>OverseerToggle! bottom<CR>", desc = "Toggle task list" },
	})
end

return {
	"stevearc/overseer.nvim",
	cmd = {
		"OverseerClose",
		"OverseerOpen",
		"OverseerRestartLast",
		"OverseerRun",
		"OverseerShell",
		"OverseerTaskAction",
		"OverseerToggle",
	},
	keys = {
		{ "<leader>ta", "<cmd>OverseerTaskAction<CR>", desc = "Task action" },
		{ "<leader>tc", "<cmd>OverseerRun<CR>", desc = "Choose task" },
		{ "<leader>tl", restart_last_task, desc = "Restart last task" },
		{ "<leader>to", "<cmd>OverseerOpen! bottom<CR>", desc = "Open task list" },
		{ "<leader>tq", "<cmd>OverseerClose<CR>", desc = "Close task list" },
		{ "<leader>tr", "<cmd>OverseerRun<CR>", desc = "Run task" },
		{ "<leader>ts", "<cmd>OverseerShell<CR>", desc = "Run shell command" },
		{ "<leader>tt", "<cmd>OverseerToggle! bottom<CR>", desc = "Toggle task list" },
	},
	config = config,
}
