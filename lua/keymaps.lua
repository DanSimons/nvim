local function map(mode, lhs, rhs, opts)
  local options = {}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- function to create a floating buffer
local function openFloatingBuffer()
  local buf = vim.api.nvim_create_buf(false, true)
  if not buf then
    print 'aa'
    return
  end

  -- set the dimensoins of the floating window
  local width = math.ceil(vim.o.columns * 0.8)
  local height = math.ceil(vim.o.lines * 0.8)
  local row = math.ceil((vim.o.lines - height) * 0.2)
  local col = math.ceil((vim.o.columns - width) / 2)

  -- create the floating window
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })
  print 'bbb'
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
map('t', ':q<CR>', '<esc><esc>:q<CR>')

-- easy splits
map('n', '<leader>v', ':vsplit<CR>')
map('n', '<leader>h', ':split<CR>')
vim.keymap.set('n', '<leader>t', function()
  openFloatingBuffer()
  vim.cmd [[ term  ]]
  vim.cmd [[ startinsert ]]
end, {})

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

return {}
