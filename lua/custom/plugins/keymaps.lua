local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- easy splits
map('n', '<leader>v', ':vsplit<CR>')
map('n', '<leader>h', ':split<CR>')

-- easy split nav
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')

-- adjust splits
map('n', '<C-Left>', ':vertical resize -3<CR>')
map('n', '<C-Right>', ':vertical resize +3<CR>')
map('n', '<C-Up>', ':horizontal resize +3<CR>')
map('n', '<C-Down>', ':horizontal resize -3<CR>')

-- open mini-files
map('n', '-', ':lua MiniFiles.open()<cr>')

-- leap keymaps
map('n', 's', '<Plug>(leap)')
map('n', 'S', '<Plug>(leap-from-window)')
map({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
map({ 'x', 'o' }, 's', '<Plug>(leap-backward)')

return {}
