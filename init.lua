require("config.lazy")

local loader = require("function.loader")

-- 基本配置
loader.load_modules("config")
-- 快捷键配置
loader.load_modules("keymap")
-- 插件配置
loader.load_modules("pconfig")
-- Vundle.vim
loader.load_modules("bundle")

vim.cmd([[

" Vim配置

command! Bd :bp | sp | bn | bd!  

call plug#begin()

Plug 'junegunn/vim-plug'                 " 插件管理器 

Plug 'tpope/vim-unimpaired'              " 提供快捷键映射

Plug 'Mofiqul/vscode.nvim'               " 配色方案

call plug#end()

colorscheme onelight
colorscheme onelight
set background=light

autocmd BufWritePost *.c   silent! !ctags -R &
autocmd BufWritePost *.cpp silent! !ctags -R &
autocmd BufWritePost *.h   silent! !ctags -R &
autocmd BufWritePost *.hpp silent! !ctags -R &

" set guifont=Monospace:h9

ClockStop
" AutoSession disable
" RenderMarkdown disable

]])
