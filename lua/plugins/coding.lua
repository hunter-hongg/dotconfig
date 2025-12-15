return {
	-- {
	-- 	"dense-analysis/ale",
	-- 	config = function()
	-- 		-- Configuration goes here.
	-- 		local g = vim.g
	--
	-- 		g.ale_ruby_rubocop_auto_correct_all = 1
	--
	-- 		g.ale_linters = {
	-- 			ruby = { "rubocop", "ruby" },
			-- }
    --
	-- 		g.ale_completion_enabled = 1
	--
	-- 		require("pconfig.ale").setup()
	-- 	end,
	-- },
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					cpp = { "astyle" },
					zig = { "zig fmt" },
                    nim = { "nimpretty" },
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
    {
      "nvim-orgmode/orgmode",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
      event = "VeryLazy",
      config = function()
        require("orgmode").setup({
          org_agenda_files = { "~/org/**/*" },
          org_default_notes_file = "~/org/refile.org",
          org_capture_templates = {
            t = {
                  description = "Todo",
              template = "* TODO %?\n  DEADLINE: %T",
              target = "~/org/todos.org",
            },
            n = {
              description = "Note",
              template = "* %?\n  %u",
              target = "~/org/notes.org",
            },
          },
          mappings = {
                    org = {
                        org_todo = "<C-c><C-t>"
                    }
                }
        })
      end,
    }
}
