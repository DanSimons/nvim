-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- remove line numbers in terminals
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'remove line numbers in terminal',
  group = vim.api.nvim_create_augroup('term', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- better terminal experience
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.buftype == 'terminal' then
      vim.cmd [[ startinsert ]]
    end
  end,
})

return {}
