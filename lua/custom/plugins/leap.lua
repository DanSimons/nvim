-- leap
-- https://github.com/ggandor/leap.nvim

return {
  'ggandor/leap.nvim',
  opts = {},
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    require 'leap'
  end,
}
