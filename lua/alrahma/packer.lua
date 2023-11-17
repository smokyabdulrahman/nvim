-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Install telescope
  use {'nvim-telescope/telescope.nvim', tag = '0.1.4', requires = { {'nvim-lua/plenary.nvim'} } }

  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use ('theprimeagen/harpoon')

end)
