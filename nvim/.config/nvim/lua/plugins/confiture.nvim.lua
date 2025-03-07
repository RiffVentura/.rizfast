return {
  'romainchapou/confiture.nvim',
  dependencies = 'tpope/vim-dispatch', -- optional but highly recommended, for async support
  keys = {
    { '<leader>b', '<cmd>silent! wa<cr><cmd>Confiture build<cr>', desc = '[B]uild code' },
  },
}
