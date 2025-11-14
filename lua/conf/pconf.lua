-- nvim-tree配置
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
	renderer = {
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
				modified = true,
				hidden = true,
				diagnostics = true,
				bookmarks = true,
			},
		},
	},
	filters = {
		enable = true,
		git_ignored = true,
		dotfiles = true,
	},
	view = {
		width = 30,
	},
})
-- 2048.nvim配置
require("2048").setup({})
-- Comment.nvim配置
require("Comment").setup()
-- toggleterm配置
require("toggleterm").setup({})
-- todo-comments.nvim配置
require("todo-comments").setup()
-- nvim-treesitter配置
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "python", "cpp", "rust", "html", "go" },
	highlight = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = true },
})
-- bufferline配置
local bufferline = require("bufferline")
bufferline.setup({
	options = {
		close_command = "silent bp | sp | b %d | bd | bn",
	},
})
-- Set up nvim-cmp.
-- local cmp = require'cmp'
-- local insert = minisnippets.config.expand.insert or minisnippets.default_insert

-- cmp.setup({
--  snippet = {
--   insert({ body = args.body })
--   cmp.resubscribe({ "textchangedi", "textchangedp" })
--   require("cmp.config").set_onetime({ sources = {} })
--  },
--     window = {
--       completion = cmp.config.window.bordered(),
--       documentation = cmp.config.window.bordered(),
--     },
--     mapping = cmp.mapping.preset.insert({
--       ['<c-b>'] = cmp.mapping.scroll_docs(-4),
--       ['<c-f>'] = cmp.mapping.scroll_docs(4),
--       ['<c-space>'] = cmp.mapping.complete(),
--       ['<c-e>'] = cmp.mapping.abort(),
--       ['<cr>'] = cmp.mapping.confirm({ select = true }),
--     }),
--     sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       {
--         name = "mini_snippets",
--         option = {
--           use_items_cache = false
--         }
--       },
--       { name = 'buffer' },
--     })
-- })
-- -- use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--       { name = 'buffer' }
--     }
-- })
-- -- use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, {
--       { name = 'cmdline' }
--     }),
--     matching = { disallow_symbol_nonprefix_matching = false }
-- })
-- noice.nvim配置
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})
-- mini.indentscope配置
require("mini.indentscope").setup()
-- rainbow-delimiters.nvim配置
---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
	strategy = {
		[""] = "rainbow-delimiters.strategy.global",
		vim = "rainbow-delimiters.strategy.local",
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	priority = {
		[""] = 110,
		lua = 210,
	},
	highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
}
-- mini.ai配置
require("mini.ai").setup()
-- neoscroll配置
require("neoscroll").setup()
-- mini.sessions配置
require("mini.sessions").setup()
-- mini.splitjoin配置
require("mini.splitjoin").setup()
-- conform.nvim配置
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "astyle" },
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})
-- ncm2配置
-- vim.cmd([[
-- " supress the annoying 'match x of y', 'The only match' and 'Pattern not
-- " found' messages
-- set shortmess+=c
--
-- " enable auto complete for `<backspace>`, `<c-w>` keys.
-- " known issue https://github.com/ncm2/ncm2/issues/7
-- au TextChangedI * call ncm2#auto_trigger()
--
-- " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
-- inoremap <c-c> <ESC>
--
-- " When the <Enter> key is pressed while the popup menu is visible, it only
-- " hides the menu. Use this mapping to close the menu and also start a new
-- " line.
-- inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
--
-- " Use <TAB> to select the popup menu:
-- inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--
-- " wrap existing omnifunc
-- " Note that omnifunc does not run in background and may probably block the
-- " editor. If you don't want to be blocked by omnifunc too often, you could
-- " add 180ms delay before the omni wrapper:
-- "  'on_complete': ['ncm2#on_complete#delay', 180,
-- "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
-- au User Ncm2Plugin call ncm2#register_source({
--         \ 'name' : 'css',
--         \ 'priority': 9,
--         \ 'subscope_enable': 1,
--         \ 'scope': ['css','scss'],
--         \ 'mark': 'css',
--         \ 'word_pattern': '[\w\-]+',
--         \ 'complete_pattern': ':\s*',
--         \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
--         \ })
-- ]])
-- vim.cmd([[
-- let g:ncm2#matcher="abbrfuzzy"
-- let g:ncm2#complete_length=1
-- ]])
require("pretty-fold").setup({
	keep_indentation = false,
	fill_char = "•",
	sections = {
		left = {
			"+",
			function()
				return string.rep("-", vim.v.foldlevel)
			end,
			" ",
			"number_of_folded_lines",
			":",
			"content",
		},
	},
})
require("pretty-fold").ft_setup("cpp", {
	process_comment_signs = false,
	comment_signs = {
		"/**", -- C++ Doxygen comments
	},
	stop_words = {
		-- ╟─ "*" ──╭───────╮── "@brief" ──╭───────╮──╢
		--          ╰─ WSP ─╯              ╰─ WSP ─╯
		"%*%s*@brief%s*",
	},
})
