-- coderunner
-- https://github.com/CRAG666/code_runner.nvim
return {
  'CRAG666/code_runner.nvim',
  opts = {
    vim.keymap.set('n', '<leader>r', ':w<CR>:RunCode<CR>', { silent = false }),
    filetype = {
      python = "bash -c 'uv run $file'",
    },
  },
}
