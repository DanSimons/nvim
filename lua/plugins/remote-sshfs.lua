-- https://github.com/nosduco/remote-sshfs.nvim
return {
  'nosduco/remote-sshfs.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('remote-sshfs').setup {}
    pcall(require('telescope').load_extension, 'remote-sshfs')

    local api = require 'remote-sshfs.api'
    vim.keymap.set('n', '<leader>mc', api.connect, { desc = '[M]ount [C]onnect' })
    vim.keymap.set('n', '<leader>md', api.disconnect, { desc = '[M]ount [D]isconnect' })
    vim.keymap.set('n', '<leader>me', api.edit, { desc = '[M]ount [E]dit SSH config' })

    local telescope = require 'telescope'
    vim.keymap.set('n', '<leader>mf', telescope.extensions['remote-sshfs'].find_files, { desc = '[M]ount [F]ind files' })
    vim.keymap.set('n', '<leader>mg', telescope.extensions['remote-sshfs'].live_grep, { desc = '[M]ount [G]rep' })
  end,
}
