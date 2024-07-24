-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<C-Left>', '<cmd>TmuxNavigateLeft<cr>' },
      { '<C-Down>', '<cmd>TmuxNavigateDown<cr>' },
      { '<C-Up>', '<cmd>TmuxNavigateUp<cr>' },
      { '<C-Right>', '<cmd>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
    },
  },
}
