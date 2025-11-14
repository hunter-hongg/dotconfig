-- 设置

vim.cmd("set nocompatible")
vim.cmd("set noshowmode")
vim.cmd("set number")
vim.cmd("set cursorline")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set incsearch")
vim.cmd("set nohlsearch")
vim.cmd("set nobackup")
vim.cmd("set nowritebackup")
vim.cmd("set noswapfile")
vim.cmd("set nu")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set background=light")
vim.cmd("set foldmethod=indent")
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- 变量

vim.cmd("let g:rainbow_active = 1")

-- Fm快捷键

-- vim.cmd("nnoremap <F1> <<")
-- vim.cmd("nnoremap <F2> >>")
-- vim.cmd("nnoremap <F3> :colorscheme onelight<CR>")
-- vim.cmd("nnoremap <F4> :colorscheme tokyonight-day<CR>")
-- vim.cmd("nnoremap <F5> :colorscheme leaf<CR>")
-- vim.cmd("nnoremap <F6> :colorscheme gruvbox<CR>")
-- vim.cmd("nmap <F8> <F10><Esc>")
-- vim.cmd("nnoremap <F9> :Play2048<CR>")
-- vim.cmd("nnoremap <F10> :CMakeSelectCwd /home/coding/学习平台<cr>:CMakeSelectBuildDir /home/coding/cmakeout<cr>:!rm ~/桌面/out<cr>:!rm ~/桌面/*.json<cr>")

-- 快捷键
vim.cmd("nnoremap <c-]> :silent ALEGoToDefinition<cr>")
vim.cmd("nmap gj <c-]>")
vim.cmd("nnoremap gf :silent ALEFix<cr>")
vim.cmd("nnoremap gm :Make!<cr>")
vim.cmd("nnoremap gs :!gcms<cr>")

-- Leader快捷键

vim.cmd("nnoremap <Leader>w :w ")
vim.cmd("nnoremap <Leader>q :q<CR>")

vim.cmd("nnoremap <Leader>s :source $MYVIMRC<CR>")
vim.cmd("nnoremap <Leader>e :e ~/.config/nvim/lua/conf/myconf.lua<CR>")
vim.cmd("nnoremap <Leader>p :e ~/.config/nvim/lua/conf/pconf.lua<CR>")
vim.cmd("nnoremap <Leader>m :e $MYVIMRC<CR>")

vim.cmd("nnoremap <Leader>t :cd ")
vim.cmd("nnoremap <Leader>ts :cd ~/学习平台<CR>")
vim.cmd("nnoremap <Leader>tp :cd ~/PerlLearning<CR>")
vim.cmd("nnoremap <Leader>tc :cd ~/cding<cr>")

vim.cmd("nnoremap <Leader>mb :CMakeSelectBuildDir /home/coding/cmakeout<CR>")
vim.cmd("nnoremap <Leader>mc :CMakeSelectCwd")
vim.cmd("nnoremap <Leader>mx :CMakeSelectCwd /home/coding/学习平台<CR>")
vim.cmd("nnoremap <Leader>mk :CMakeBuild -j4<CR>")
vim.cmd("nnoremap <Leader>mr :CMakeRun<CR>")

vim.cmd("nnoremap <leader>ff <cmd>Telescope find_files<cr>")
vim.cmd("nnoremap <leader>fg <cmd>Telescope live_grep<cr>")
vim.cmd("nnoremap <leader>fb <cmd>Telescope buffers<cr>")
vim.cmd("nnoremap <leader>fh <cmd>Telescope help_tags<cr>")

-- Ctrl快捷键新

vim.cmd("nnoremap <C-g> :LazyGit<CR>")
vim.cmd("nnoremap <C-S-g> :Neogit<cr>")
vim.cmd("nnoremap <C-s> :wa!<CR>")
vim.cmd("inoremap <C-s> <Esc>:wa<CR>i")
vim.cmd("nnoremap <C-o> :Neotree<CR>:vertical resize 30<CR><C-w><C-l>")
vim.cmd("nnoremap <C-x> :")
vim.cmd("nnoremap <C-h> <C-w>h")
vim.cmd("nnoremap <C-j> <C-w>j")
vim.cmd("nnoremap <C-k> <C-w>k")
vim.cmd("nnoremap <C-l> <C-w>l")
vim.cmd("nnoremap <C-n> :ene<cr>")
vim.cmd("nnoremap <C-e> :e ~/.config/nvim/lua/conf/lualine-conf.lua")
vim.cmd("nnoremap <C-Tab> :bn<CR>")
vim.cmd("nnoremap <C-PageUp> :bp<CR>")
vim.cmd("nnoremap <C-PageDown> :bn<CR>")
vim.cmd("nnoremap <C-p> :Telescope find_files<CR>")
vim.cmd("nnoremap <C-z> u")
vim.cmd("nnoremap <C-S-z> <C-r>")

-- Meta快捷键

vim.cmd("nnoremap <M-x> :Lazy<CR>")
vim.cmd("nnoremap <M-d> :Neotree close<cr>:Dashboard <cr>")
vim.cmd("nnoremap <M-s> :AutoSession save<cr>")
vim.cmd("nnoremap <M-r> :AutoSession restore ")
vim.cmd("nnoremap <M-u> :lua require('undotree').toggle()<cr>")
vim.cmd("nmap <M-q> <leader>fg")
vim.cmd("nnoremap <M-w> :silent Bd <cr>")

-- 对调;:

vim.cmd("nnoremap ; :")
vim.cmd("nnoremap : ;")
vim.cmd("vnoremap ; :")
vim.cmd("vnoremap : ;")
vim.cmd("cnoremap ; :")
vim.cmd("cnoremap : ;")

-- 禁用上下左右
vim.cmd("nnoremap <Up> <nop>")
vim.cmd("nnoremap <Down> <nop>")
vim.cmd("nnoremap <Left> <nop>")
vim.cmd("nnoremap <Right> <nop>")

-- toggleterm.nvim特殊配置
vim.cmd('" set')
vim.cmd('autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>')
vim.cmd('" By applying the mappings this way you can pass a count to your')
vim.cmd('" mapping to open a specific window.')
vim.cmd('" For example: 2<C-t> will open terminal 2')
vim.cmd('nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>')
vim.cmd('inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>')
vim.cmd("nmap <silent><c-`> <c-t>")
vim.cmd("imap <silent><c-`> <c-t>")
vim.cmd("tmap <silent><c-`> <c-t>")

--  其他配置
vim.cmd("nnoremap <Tab> za")
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
vim.cmd([[
augroup dashboard_settings
  autocmd!
  autocmd FileType dashboard setlocal foldmethod=manual
augroup end
]])
