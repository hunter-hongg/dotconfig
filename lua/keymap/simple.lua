vim.cmd("nmap gj :silent ALEGoToDefinition<cr>")
vim.cmd("nnoremap gf :silent ALEFix<cr>")
vim.cmd("nnoremap gm :Make!<cr>")
vim.cmd("nnoremap gs :!gcms<cr>")
vim.cmd[[
nnoremap gw    :silent Bd <cr>
nnoremap zs    :silent AutoSession save<cr>
    ]]
