local function map(mode, lhs, rhs, opts)
  local options = {}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- term mode remaps
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('t', '<C-h>', '<esc><esc><C-w>h')
map('t', '<C-j>', '<esc><esc><C-w>j')
map('t', '<C-k>', '<esc><esc><C-w>k')
map('t', '<C-l>', '<esc><esc><C-w>l')
map('t', '<C-c>', 'clear<CR>')
map('t', '<C-q>', '<esc><esc>:q<CR>')

-- easy splits
map('n', '<leader>v', ':vsplit<CR>')
map('n', '<leader>h', ':split<CR>')

-- easy split nav
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')

-- adjust splits
map('n', '<C-Left>', ':vertical resize -3<CR>')
map('n', '<C-Right>', ':vertical resize +3<CR>')
map('n', '<C-Up>', ':horizontal resize +3<CR>')
map('n', '<C-Down>', ':horizontal resize -3<CR>')

-- tab keys
map('n', '<Tab>', ':tabn<CR>')
map('n', '<S-Tab>', ':tabp<CR>')

-- qmd shortcuts
map('n', '<leader>py', ":lua require('nvim-autopairs').disable()<CR>o```{python}<CR>```<esc>:lua require('nvim-autopairs').enable()<CR>O")
map('n', '<leader>ci', ':vsplit term://ipython<CR> <C-h>')
map('n', '<C-c>', '<C-l>clear<CR><C-h>')

return {}
