return {
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	{
		"nvim-tree/nvim-web-devicons",
		config = { default = true },
	},
	{ "nacro90/numb.nvim", event = "BufReadPre", config = true },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = true,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		enabled = true,
		config = { default = true }, -- same as config = true
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = true,
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		config = {
			integrations = { diffview = true },
		},
		keys = {
			{ "<leader>gs", "<cmd>Neogit kind=floating<cr>", desc = "Status" },
		},
	},
	{
		"monaqa/dial.nvim",
		keys = { "<C-a>", "<C-x>", { "<C-a>", "v" }, { "<C-x>", "v" }, { "g<C-a>", "v" }, { "g<C-x>", "v" } },
    -- stylua: ignore
    init = function()
      vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { desc = "Increment", noremap = true })
      vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { desc = "Decrement", noremap = true })
      vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { desc = "Increment", noremap = true })
      vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { desc = "Decrement", noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { desc = "Increment", noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { desc = "Decrement", noremap = true })
    end,
	},
	{
		"andymass/vim-matchup",
		lazy = false,
		enabled = true,
		init = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"krivahtoo/silicon.nvim",
		cmd = "Silicon",
		--event = "BufReadPre",
		config = function() end,
	},
}
