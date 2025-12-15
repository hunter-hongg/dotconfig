return {
  -- coc.nvim - 主补全引擎
  {
    'neoclide/coc.nvim',
    branch = 'release',
    -- build = 'npm ci',
    config = function()
      require('config.completion').setup_coc()
    end
  },
  
  -- nvim-cmp - 补全框架
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    },
    -- config = function()
    --   require('config.completion').setup_cmp()
    -- end
  },
  
  -- LuaSnip
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('config.completion').setup_snippets()
    end
  },
  
  -- 自动配对
  -- {
  --   'windwp/nvim-autopairs',
  --       properties = 500,
  --   config = function()
  --     require('nvim-autopairs').setup()
  --   end
  -- },
  
  -- LSP 配置
  {
    'neovim/nvim-lspconfig',
    -- config = function()
    --   require('config.completion').setup_language_servers()
    -- end
  },
  
  -- cmp-nvim-lsp
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  
  -- cmp-buffer
  {
    'hrsh7th/cmp-buffer',
  },
  
  -- cmp-path
  {
    'hrsh7th/cmp-path',
  },
  
  -- cmp-cmdline
  {
    'hrsh7th/cmp-cmdline',
  },
  
  -- cmp_luasnip
  {
    'saadparwaiz1/cmp_luasnip',
  },
  
  -- friendly-snippets
  {
    'rafamadriz/friendly-snippets',
  },
}
