vim.cmd([[

" 普通配置
nnoremap <M-w> :silent Bd <cr>

" 插件配置
nnoremap <M-x> :Lazy<CR>
nnoremap <M-d> :lua Snacks.dashboard()<cr>
nnoremap <M-s> :AutoSession save<cr>
nnoremap <M-r> :AutoSession restore 
nnoremap <M-q> :lua Snacks.dashboard.pick('live_grep')<cr>

]])
