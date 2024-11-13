-- plugins/quarto.lua
return {
  {
    'quarto-dev/quarto-nvim',
    opts = {},
    dependencies = {
      'jmbuhr/otter.nvim',
      opts = {},
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
