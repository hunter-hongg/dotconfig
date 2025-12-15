vim.cmd([[

augroup dashboard_settings
  autocmd!
  autocmd FileType dashboard setlocal foldmethod=manual
augroup end
autocmd TextChanged * silent! wall
autocmd TextChangedI * silent! wall
autocmd TextChanged * silent! Format
" 使用 vimscript 原生语法定义 autocmd
function! OnDashboardClose()
  " 获取当前缓冲区的名称
  let bufname = expand('%:p')
  " 获取当前缓冲区的文件类型
  let filetype = &filetype
  
  " 检查是否是 snacks dashboard
  if bufname =~# 'Snacks' || filetype ==# 'dashboard'
    " echo "Dashboard 已退出"
    
    " 延迟执行，确保 dashboard 完全关闭
    call timer_start(50, {-> execute("call AfterDashboardClosed()")})
  endif
endfunction

" 定义退出 dashboard 后要执行的函数
function! AfterDashboardClosed()
  " 在这里执行你的操作
  " echo "正在执行 dashboard 关闭后的操作..."
  
  " 示例1: 自动打开文件管理器
  " if exists(':NvimTreeOpen')
    " NvimTreeOpen
  " endif
  
  " 示例2: 显示状态
  " echo "Dashboard 已完全关闭"
  
  " 示例3: 检查插件更新
  " if exists(':Lazy')
  "   Lazy status
  " endif
  silent! lua Org.agenda.a()
  " echo "Hello from Neovim!"
endfunction

" 创建 autocmd
augroup DashboardEvents
  autocmd!
  autocmd BufLeave * call OnDashboardClose()
augroup END
]])
