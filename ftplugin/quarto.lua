vim.b.slime_cell_delimeter = '```'

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'auto open ipython terminal in qmd files',
  group = vim.api.nvim_create_augroup('term', { clear = true }),
  callback = function()
    vim.cmd [[ vsplit term://ipython ]]
  end,
})

local function map(mode, lhs, rhs, opts)
  local options = {}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- qmd shortcuts
map('n', '<leader>py', ":lua require('nvim-autopairs').disable()<CR>o```{python}<CR>```<esc>:lua require('nvim-autopairs').enable()<CR>O")
map('n', '<leader>ci', ':vsplit term://ipython<CR> <C-h>')
map('n', '<C-c>', '<C-l>clear<CR><C-h>')
map('n', '<leader>p', ':call slime#send_cell()<CR>')
map('n', '<leader>P', ':call slime#send_cell()<CR>/```{python}<CR><esc>')
-- vim.keymap.set({ 'n' }, '<leader>p', function()
--   vim.cmd [[ call slime#send_cell() ]]
-- end)
-- vim.keymap.set({ 'n' }, '<leader>P', function()
--   vim.cmd [[ normal! /```{python}<CR><esc>]]
-- end)
