vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'marko-cerovac/material.nvim'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }


    use 'neovim/nvim-lspconfig'
  --   use 'hrsh7th/cmp-nvim-lsp'
  --   use 'hrsh7th/cmp-buffer'
  --   use 'hrsh7th/cmp-path'
  --   use 'hrsh7th/cmp-cmdline'
  --   use 'hrsh7th/nvim-cmp'

  --   -- snippets
  -- use "L3MON4D3/LuaSnip" --snippet engine
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use "Pocco81/AutoSave.nvim"

    use {
      "blackCauldron7/surround.nvim",
      config = function()
        require"surround".setup {mappings_style = "sandwich"}
      end
	  }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
          'romgrk/barbar.nvim',
          requires = {'kyazdani42/nvim-web-devicons'}
    }
end)
