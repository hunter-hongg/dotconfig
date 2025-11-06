require("conf.myconf")
require("config.lazy")
require("conf.pconf")
require("conf.cmake-tools-conf")
require("conf.lualine-conf")

vim.cmd[[

" Vim配置

command! Bd :bp | sp | bn | bd  

call plug#begin()

Plug 'junegunn/vim-plug'                 " 插件管理器 

Plug 'tpope/vim-unimpaired'              " 提供快捷键映射

Plug 'Mofiqul/vscode.nvim'               " 配色方案

call plug#end()

colorscheme onelight
colorscheme onelight

autocmd BufWritePost *.c *.cpp *.h *.hpp silent! !ctags -R &

]]
