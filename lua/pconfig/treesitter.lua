-- nvim-treesitter配置
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "python", "cpp", "rust", "html", "go" },
	highlight = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = true },
})
