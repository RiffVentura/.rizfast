-- See the kickstart.nvim README for more information
return {
  {
    'alexghergh/nvim-tmux-navigation',
    lazy = false,
    opts = {
      disable_when_zoomed = true,
      keybindings = {
        left = '<C-Left>',
        right = '<C-Right>',
        up = '<C-Up>',
        down = '<C-Down>',
        -- last_active = '<C-Tab>',
      },
    },
  },
}
