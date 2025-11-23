vim.cmd([[

" 基本配置
nnoremap <C-o> :NvimTreeToggle<CR><C-w><C-l>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-z> u
nnoremap <C-S-z> <C-r>

" 旧保存文件
nnoremap <C-s> <nop>
inoremap <C-s> <nop>

" Git配置
nnoremap <C-g> :LazyGit<CR>
nnoremap <C-S-g> :Neogit<cr>

]])
