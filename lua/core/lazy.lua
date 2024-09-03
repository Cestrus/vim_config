-- Bootstrap lazy.nvim
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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    --  { import = "plugins" },
    {
       "nvim-neo-tree/neo-tree.nvim",
       branch = "v3.x",
       dependencies = { 
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      	 "MunifTanjim/nui.nvim",
     	 -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      	 "s1n7ax/nvim-window-picker"	 
       }
    },  
    {"nvim-treesitter/nvim-treesitter"},
    {"neovim/nvim-lspconfig"},
    {"joshdick/onedark.vim"},
    {'rebelot/kanagawa.nvim'},
    {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, {'lewis6991/gitsigns.nvim'},
    {"williamboman/mason.nvim"},
    {
      'nvim-telescope/telescope.nvim', branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {'jose-elias-alvarez/null-ls.nvim'},
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
      -- use opts = {} for passing setup options
      -- this is equivalent to setup({}) function
    },
    {'windwp/nvim-ts-autotag'}, 
    {
      'akinsho/bufferline.nvim', 
      version = "*", 
      dependencies = {'nvim-tree/nvim-web-devicons'}
    },
    {'terrortylor/nvim-comment'},
    {'lewis6991/gitsigns.nvim'},
    {'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        }
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {"folke/which-key.nvim"}
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installitg plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
