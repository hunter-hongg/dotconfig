vim.cmd[[

set nocompatible              " 原注释: be iMproved, required
filetype off                  " 原注释: required

" 原注释: set the runtime path to include Vundle and initialize
set rtp+=~/.local/share/nvim/bundle/Vundle.vim
call vundle#begin()

" 规则请看原内容

Plugin 'hunter-hongg/Vundle.vim'

call vundle#end()            " 原注释: required
filetype plugin indent on    " 原注释: required

]]
