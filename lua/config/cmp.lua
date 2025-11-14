-- ~/.config/nvim/lua/conf/cmp.lua

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

lspkind.init()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

return {
	setup = function()
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enter 接受建议

				-- ✅ 禁用 Tab 键补全功能
				["<Tab>"] = cmp.mapping(function(fallback)
					fallback() -- 保持原生 Tab 行为（比如插入空格或触发 snippet）
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					fallback() -- 同上
				end, { "i", "s" }),

				-- ✅ 上下键只选择菜单项，不插入内容
				["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
			},
			preselect = cmp.PreselectMode.Item,
		})
	end,
	-- 强制在菜单打开时选中第一个
	cmp.event:on("menu_opened", function()
		vim.schedule(function()
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		end)
	end),
}
