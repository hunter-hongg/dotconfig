vim.cmd([[

augroup dashboard_settings
  autocmd!
  autocmd FileType dashboard setlocal foldmethod=manual
augroup end
autocmd TextChanged * silent! wall
autocmd TextChangedI * silent! wall

]])
