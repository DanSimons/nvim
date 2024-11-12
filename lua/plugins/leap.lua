-- leap
-- https://github.com/ggandor/leap.nvim

return {
  'ggandor/leap.nvim',
  opts = {},
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    require('leap').setup {
      vim.keymap.set('n', 's', '<Plug>(leap)'),
      vim.keymap.set('n', 'S', '<Plug>(leap-from-window)'),
      vim.keymap.set('x', 's', '<Plug>(leap-forward)'),
      vim.keymap.set('o', 's', '<Plug>(leap-forward)'),
      vim.keymap.set('x', 'S', '<Plug>(leap-backward)'),
      vim.keymap.set('o', 'S', '<Plug>(leap-backward)'),
    }
  end,
}
