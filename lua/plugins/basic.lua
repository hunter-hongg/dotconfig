return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
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
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
			vim.cmd([[ 
                " set
                autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
                " By applying the mappings this way you can pass a count to your
                " mapping to open a specific window.
                " For example: 2<C-t> will open terminal 2
                nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
                inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
                nmap <silent><c-`> <c-t>
                imap <silent><c-`> <c-t>
                tmap <silent><c-`> <c-t>
            ]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "filesize", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		config = true,
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		opts = {},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					close_command = "silent bp | sp | b %d | bd | bn",
					separator_style = "slant",
				},
			})
		end,
	},
	{ "nvim-mini/mini.nvim", version = "*" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-notify",
			"rcarriga/nvim-notify",
		},
		config = function()
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
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"Hiphish/rainbow-delimiters.nvim",
		config = function()
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
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			icons = {
				mappings = false,
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
            require('nvim-autopairs').setup()
            vim.keymap.set('i',  '<CR>','coc#pum#visible() ? coc#pum#confirm() : coc#inline#visible() ? coc#inline#accept() : "<cr>" ', {expr = true, silent = true})
        end,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"jiaoshijie/undotree",
		---@module 'undotree.collector'
		---@type UndoTreeCollector.Opts
		opts = {
			-- your options
		},
		keys = { -- load the plugin only when using it's keybinding:
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
	{ "duane9/nvim-rg" },
	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
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
		end,
	},
	{
		"registerGen/clock.nvim",
		config = true,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { 
                enabled = true ,
                preset = {
                    keys = {
                        { icon = "", key = "f", desc = "查找文件", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = "", key = "n", desc = "新建文件", action = ":ene" },
                        { icon = "", key = "r", desc = "最近文件", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = "", key = "c", desc = "配置文件", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = "", key = "s", desc = "恢复会话", action = ":AutoSession search" },
                        { icon = "", key = "l", desc = "插件管理", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                        { icon = "", key = "q", desc = "退出面板", action = ":q"},
                        { icon = "", key = "Q", desc = "退出Neovim", action = ":qa" },
                    },
                }
            },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
}
