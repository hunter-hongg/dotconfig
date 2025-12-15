local M = {}

-- 设置 coc.nvim
function M.setup_coc()
  -- coc.nvim 配置
  vim.g.coc_global_extensions = {
    'coc-marketplace',
    'coc-json',
    'coc-clangd',        -- C/C++
    'coc-pyright',       -- Python
    'coc-rust-analyzer', -- Rust
    'coc-go',            -- Go
    'coc-sumneko-lua',   -- Lua
    'coc-snippets',
    'coc-tsserver',
    'coc-html',
    'coc-css',
    'coc-emmet',
    'coc-prettier',
    'coc-eslint',
    'coc-diagnostic',
  }

  -- coc.nvim 快捷键
  vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { expr = true, silent = true })
  -- vim.keymap.set('i', '<tab>', '"<C-n>"', { expr = true })
  -- vim.keymap.set('i', '<s-tab>', 'pumvisible() ? "<C-p>" : "<s-tab>"', { expr = true })
  -- vim.keymap.set('i',  '<CR>','coc#pum#visible() ? coc#pum#confirm() : coc#inline#visible() ? coc#inline#accept() : "<cr>" ', {expr = true, silent = true})
  
  -- 使用 <c-j> 和 <c-k> 导航补全列表
  vim.keymap.set('i', '<C-j>', 'pumvisible() ? "<C-n>" : "<C-j>"', { expr = true })
  vim.keymap.set('i', '<C-k>', 'pumvisible() ? "<C-p>" : "<C-k>"', { expr = true })
  
  -- 跳转到定义
  vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
  vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
  vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
  vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
  
  -- 重命名
  vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })
  
  -- 格式化
  vim.keymap.set('n', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
  vim.keymap.set('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
  
  -- 显示文档
  function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
    else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
  end
  vim.keymap.set('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })
  
  -- 代码操作
  vim.keymap.set('n', '<leader>ca', '<Plug>(coc-codeaction)', { silent = true })
  vim.keymap.set('x', '<leader>ca', '<Plug>(coc-codeaction-selected)', { silent = true })
  vim.keymap.set('n', '<leader>cl', '<Plug>(coc-codelens-action)', { silent = true })
  
  -- 诊断导航
  vim.keymap.set('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true })
  vim.keymap.set('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true })
  
  -- 自动命令
  vim.api.nvim_create_autocmd('CursorHold', {
    pattern = '*',
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end
  })
  
  -- 高亮符号
  -- vim.api.nvim_create_autocmd('CursorHold', {
  --   pattern = '*',
  --   callback = function()
  --     if vim.fn.CocHasProvider('documentHighlight') then
  --       vim.fn.CocActionAsync('documentHighlight')
  --     end
  --   end
  -- })
  
  vim.api.nvim_create_autocmd('CursorMoved', {
    pattern = '*',
    callback = function()
      -- vim.fn.CocActionAsync('clearHighlight', 'CursorHold')
    end
  })
end

-- 设置 nvim-cmp
-- function M.setup_cmp()
--   local cmp = require('cmp')
--   local luasnip = require('luasnip')
--   
--   require('luasnip.loaders.from_vscode').lazy_load()
--   
--   cmp.setup({
--     snippet = {
--       expand = function(args)
--         luasnip.lsp_expand(args.body)
--       end,
--     },
--     mapping = cmp.mapping.preset.insert({
--       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.abort(),
--       ['<CR>'] = cmp.mapping.confirm({ select = true }),
--       ['<Tab>'] = cmp.mapping(function(fallback)
--         if cmp.visible() then
    --     --   cmp.select_next_item()
    --     -- elseif luasnip.expand_or_jumpable() then
--     --   luasnip.expand_or_jump()
--     else
--       fallback()
--     end
--   end, { 'i', 's' }),
--   ['<S-Tab>'] = cmp.mapping(function(fallback)
--     if cmp.visible() then
--       cmp.select_prev_item()
--     elseif luasnip.jumpable(-1) then
--       luasnip.jump(-1)
--     else
--       fallback()
--     end
--   end, { 'i', 's' }),
-- }),
-- sources = cmp.config.sources({
--   { name = 'nvim_lsp' },
--   { name = 'luasnip' },
--   { name = 'buffer' },
--   { name = 'path' },
-- }),
-- formatting = {
--   format = function(entry, vim_item)
--     vim_item.menu = ({
--       buffer = '[Buffer]',
--       nvim_lsp = '[LSP]',
--       luasnip = '[LuaSnip]',
--       nvim_lua = '[Lua]',
--       latex_symbols = '[LaTeX]',
--     })[entry.source.name]
--     return vim_item
--   end
-- },
-- window = {
--   completion = cmp.config.window.bordered(),
--   documentation = cmp.config.window.bordered(),
-- },
-- })
--   
--   -- 命令行补全
--   cmp.setup.cmdline('/', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--       { name = 'buffer' }
--     }
--   })
--   
--   cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, {
--       { name = 'cmdline' }
--     })
--   })
-- end

-- 设置自动配对
-- function M.setup_autopairs()
--   require('nvim-autopairs').setup()
--   local cmp_autopairs = require('nvim-autopairs.completion.cmp')
--   local cmp = require('cmp')
--   cmp.event:on(
--     'confirm_done',
--     cmp_autopairs.on_confirm_done()
--   )
-- end
--
-- 设置 snippets
function M.setup_snippets()
  require('luasnip.loaders.from_vscode').lazy_load()
end

-- 初始化所有补全配置
function M.setup()
  -- 设置补全选项
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' }
  vim.opt.shortmess:append('c')
  vim.opt.updatetime = 300

  -- 应用各个组件的配置
  M.setup_coc()
  -- M.setup_cmp()
  -- M.setup_autopairs()
  M.setup_snippets()

  -- 语言服务器配置提示
  -- M.setup_language_servers()
end

-- 语言服务器配置
-- function M.setup_language_servers()
--   -- 语言特定设置
--   -- local servers = {
--   --   clangd = {},      -- C/C++
--   --   pyright = {},     -- Python
--   --   rust_analyzer = {}, -- Rust
--   --   gopls = {},       -- Go
--     -- lua_ls = {        -- Lua
--     --   Lua = {
--     --     workspace = { checkThirdParty = false },
--     --     telemetry = { enable = false },
--     --   },
--   --   }
--   -- }
-- local servers = {
--   clangd = {},       -- C/C++
--   pyright = {},      -- Python
--   rust_analyzer = {}, -- Rust
--   gopls = {},        -- Go
--   lua_ls = {         -- Lua
--     settings = {
--       Lua = {
--         workspace = { checkThirdParty = false },
--         telemetry = { enable = false },
--       },
--     },
--   }
-- }
--
-- -- 获取 LSP 能力
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- 如果需要 cmp 集成，确保 nvim-cmp 已安装
-- -- capabilities.textDocument.completion.completionItem = {
-- --   snippetSupport = true,
-- --   preselectSupport = true,
-- --   insertReplaceSupport = true,
-- --   labelDetailsSupport = true,
-- --   deprecatedSupport = true,
-- --   commitCharactersSupport = true,
-- --   tagSupport = { valueSet = { 1 } },
-- --   resolveSupport = {
-- --     properties = { 'documentation', 'detail', 'additionalTextEdits' },
-- --   },
-- -- }
--
-- -- 通用 on_attach 函数
-- local on_attach = function(client, bufnr)
--   -- 按键绑定
--   local bufopts = { noremap = true, silent = true, buffer = bufnr }
--   
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, bufopts)
--   vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
--   vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
--   vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
--   vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
--   vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)
-- end
--
-- -- 为每种语言启动 LSP
--     for server, config in pairs(servers) do
--       local final_config = vim.tbl_deep_extend('force', {
--         capabilities = capabilities,
--         on_attach = on_attach,
--       }, config or {})
--       
--       vim.lsp.start(final_config)
--     end
-- end

-- 语言服务器自动命令
function M.setup_lsp_autocmds()
  -- 高亮显示当前变量的引用
  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.document_highlight()
    end
  })
  
  vim.api.nvim_create_autocmd('CursorMoved', {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.clear_references()
    end
  })
  
  -- 保存时格式化
  vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function(args)
      vim.lsp.buf.format({ async = false })
    end
  })
end

-- 快速安装命令
function M.install_extensions()
  -- 安装 coc 扩展
  vim.cmd('CocInstall -sync ' .. table.concat(vim.g.coc_global_extensions, ' '))
  vim.notify('Coc extensions installed successfully!', vim.log.levels.INFO)
end

-- 导出模块
return M
