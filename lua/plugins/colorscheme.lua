return {
	{
		"rockyzhang24/arctic.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		name = "arctic",
		branch = "main",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme arctic")
		end,
	},
	{ "hunter-hongg/onedarkpro.nvim" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{ "projekt0n/github-nvim-theme", name = "github-theme" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "rebelot/kanagawa.nvim" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{ "daschw/leaf.nvim" },
}
