local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
 --Installing Plugins form Lazy
----------------------------------------------------------------------------------------------
                --EDITOR RELATED PLUGINS
----------------------------------------------------------------------------------------------
--lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = function()
      -- Load specific config from the 'lualine.lua' file
      require('plugins.nvim-lualine')
    end
  },

--autopairs
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      -- Load specific config from the 'lualine.lua' file
      require('nvim-autopairs').setup()
    end
},
--autotags
{
  
  'windwp/nvim-ts-autotag',
  event = "BufReadPre",
  ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue", "xml" },
  config = function()
    require('nvim-ts-autotag').setup()
    end
},

{
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('ibl').setup({
      scope = {
        show_end = false,
        show_exact_scope = true,
        show_start = false,
      },
    })
  end,
},

----------------------------------------------------------------------------------------------
                --Navigation 
----------------------------------------------------------------------------------------------
{
  "christoomey/vim-tmux-navigator",
  lazy=false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
},
----------------------------------------------------------------------------------------------
                --COLORSCEHEMS
----------------------------------------------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    config = function()
      require('plugins.nvim-tokyonight')
    end
  },

----------------------------------------------------------------------------------------------
                --EXPLORER
----------------------------------------------------------------------------------------------
--oil
{
  'stevearc/oil.nvim',
  config = function()
    require('plugins.nvim-oil')
  end
},

----------------------------------------------------------------------------------------------
                --Treesitter
----------------------------------------------------------------------------------------------
{
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require('plugins.nvim-treesitter')
  end

},

----------------------------------------------------------------------------------------------
                --Telescope
----------------------------------------------------------------------------------------------
{
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,  -- Load immediately
  config = function()
    require('plugins.nvim-telescope')
  end,
},

})
