local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	
	{
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd [[colorscheme tokyonight-moon]]
    end,
	},

  -- Commenting support.
  'tpope/vim-commentary',

  -- Commenting support.
  'tpope/vim-commentary',

  -- Add, change, and delete surrounding text.
  'tpope/vim-surround',

  -- Useful commands like :Rename and :SudoWrite.
  'tpope/vim-eunuch',

  -- Pairs of handy bracket mappings, like [b and ]b.
  'tpope/vim-unimpaired',

  -- Indent autodetection with editorconfig support.
  'tpope/vim-sleuth',

  -- Allow plugins to enable repeating of commands.
  'tpope/vim-repeat',

  --- Vim Sneak
  'justinmk/vim-sneak',

  -- Add more languages.
  'sheerun/vim-polyglot',

  -- Navigate seamlessly between Vim windows and Tmux panes.
  'christoomey/vim-tmux-navigator',

  -- Jump to the last location when opening a file.
  'farmergreg/vim-lastplace',

  -- Enable * searching with visually selected text.
  'nelstrom/vim-visual-star-search',

  -- Automatically create parent dirs when saving.
  'jessarcher/vim-heritage',

  -- Text objects for HTML attributes.
  {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = 'kana/vim-textobj-user',
  },

  -- Automatically set the working directory to the project root.
  {
    'airblade/vim-rooter',
    init = function()
      -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
      vim.g.rooter_manual_only = 1
    end,
    config = function()
      vim.cmd('Rooter')
    end,
  },

  -- Automatically add closing brackets, quotes, etc.
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },

  -- Add smooth scrolling to avoid jarring jumps
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  },

  -- All closing buffers without closing the split window.
  {
    'famiu/bufdelete.nvim',
    config = function()
      vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
    end,
  },

  -- Split arrays and methods onto multiple lines, or join them back up.
  {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_php_method_chain_full = 1
    end,
  },

  -- Automatically fix indentation when pasting code.
  {
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('user/plugins/telescope')
    end,
  },

  -- File tree sidebar
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user/plugins/nvim-tree')
    end,
  },

  -- A Status line.
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user/plugins/lualine')
    end,
  },
  
  -- Display indentation lines.
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('user/plugins/indent-blankline')
    end,
  },

  -- Git integration.
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
      vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
      vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
      vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
      vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
      vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
    end,
  },

  -- Git commands.
  {
    'tpope/vim-fugitive',
    dependencies = 'tpope/vim-rhubarb',
  },

  --- Floating terminal.
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
      vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
      vim.cmd([[
        highlight link Floaterm CursorLine
        highlight link FloatermBorder CursorLineBg
      ]])
    end
  },

  -- Improved syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('user/plugins/treesitter')
    end,
  },

  -- Language Server Protocol.
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jayp0521/mason-null-ls.nvim',
    },
    config = function()
      require('user/plugins/lspconfig')
    end,
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
    },
    config = function()
      require('user/plugins/cmp')
    end,
  },

  -- PHP Refactoring Tools
  {
    'phpactor/phpactor',
    ft = 'php',
    build = 'composer install --no-dev --optimize-autoloader',
    config = function()
      vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
      vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
    end,
  },

  -- Project Configuration.
  {
    'tpope/vim-projectionist',
    dependencies = 'tpope/vim-dispatch',
    config = function()
      require('user/plugins/projectionist')
    end,
  },

  -- Testing helper
  {
    'vim-test/vim-test',
    config = function()
      require('user/plugins/vim-test')
    end,
  },
  
  -- Custom - Harpoon
  'ThePrimeagen/harpoon',
  
  -- Tabline
  {
    'kdheepak/tabline.nvim',
    config = function()
      require 'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
          section_separators = { '', '' },
          component_separators = { '', '' },
          max_bufferline_percent = 80, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = true, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        }
      }
      vim.cmd [[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    dependencies = { { 'nvim-lualine/lualine.nvim', lazy = true }, { 'kyazdani42/nvim-web-devicons', lazy = true } }
  },

  -- Scope.nvim
  {
    'tiagovla/scope.nvim',
    config = function()
      require("scope").setup()
    end,
  },

  -- Sessions
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
      }
    end
  },

  -- Copilot
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require('user/plugins/copilot')
    end
  },

  -- Copilot - Lualine
  'AndreM222/copilot-lualine',

})

