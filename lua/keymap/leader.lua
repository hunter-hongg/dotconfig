vim.cmd([[

" 基础文件编辑
nnoremap <Leader>q :q<cr>

" 配置文件编辑
nnoremap <Leader>m :e $MYVIMRC<CR>

" 目录导航
nnoremap <Leader>t :cd 
nnoremap <Leader>ts :cd ~/学习平台<CR>
nnoremap <Leader>tp :cd ~/PerlLearning<CR>
nnoremap <Leader>tc :cd ~/cding<cr>

" Telescope快捷键
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

]])
