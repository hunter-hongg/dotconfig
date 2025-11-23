-- ~/.config/nvim/lua/conf/ale.lua

local M = {}

function M.setup()
	-- 启用 LSP 补全
	vim.g.ale_completion_enabled = 1
	vim.g.ale_hover_to_floating_preview = 1

	-- 设置 Linters（根据你使用的语言修改）
	vim.g.ale_linters = {
		javascript = { "eslint" },
		typescript = { "tsserver" },
		python = { "pylsp" },
		lua = { "lua_ls" },
		cpp = { "clangd" },
		c = { "clangd" },
		zig = { "zls" },
	}

	-- 显示设置
	vim.g.ale_sign_column_always = 1
	vim.g.ale_echo_msg_error_str = "E"
	vim.g.ale_echo_msg_warning_str = "W"
	vim.cmd([[
      let g:ale_fixers = {
      \   'javascript': [
      \       'DoSomething',
      \       'eslint',
      \       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
      \   ],
      \   'cpp': [
      \       'clangtidy', 
      \   ], 
      \ }
    ]])
	vim.cmd([[
        let g:ale_pattern_options = {
        \   '\v.*invalid parameter name: ''auto'' is a keyword': {'enabled': 0},
        \}
    ]])
end

return M
