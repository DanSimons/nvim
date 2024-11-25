vim.b.slime_cell_delimeter = '```'

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
map('n', '<leader>cl', '<C-l>clear<CR><C-h>')
map('n', '<leader>p', ':call slime#send_cell()<CR>')
map('n', '<leader>P', ':call slime#send_cell()<CR>/```{python}<CR><esc>')
