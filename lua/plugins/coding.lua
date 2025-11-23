return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("pconfig.cmp").setup()
		end,
	},
	{ "onsails/lspkind.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{
		"dense-analysis/ale",
		config = function()
			-- Configuration goes here.
			local g = vim.g

			g.ale_ruby_rubocop_auto_correct_all = 1

			g.ale_linters = {
				ruby = { "rubocop", "ruby" },
			}

			g.ale_completion_enabled = 1

			require("pconfig.ale").setup()
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					cpp = { "astyle" },
					zig = { "zig fmt" },
				},
				format_on_save = function(bufnr)
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 500, lsp_format = "fallback" }
				end,
			})
		end,
		opts = {},
	},
	{ "tpope/vim-dispatch" },
}
