return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{
							icon_hl = "@variable",
							desc = "插件管理",
							action = "Lazy",
							key = "a",
							group = "Label",
						},
						{
							icon_hl = "@variable",
							desc = "新建文件",
							action = "ene",
							key = "b",
							group = "Label",
						},
						{
							icon_hl = "@variable",
							desc = "打开文件",
							action = "Telescope find_files",
							key = "c",
							group = "Label",
						},
						{
							icon_hl = "@variable",
							desc = "恢复会话",
							action = "AutoSession search",
							key = "d",
							group = "Label",
						},
						{
							icon_hl = "@variable",
							desc = "退出Neovim",
							action = "qa",
							key = "e",
							group = "Label",
						},
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
