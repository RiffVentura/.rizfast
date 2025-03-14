function _G.toggle_diagnostics()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
    vim.print 'Diagnostics turned off'
  else
    vim.diagnostic.enable(true)
    vim.print 'Diagnostics turned on'
  end
end
vim.keymap.set('n', '<leader>te', ':call v:lua.toggle_diagnostics()<cr>', { desc = 'Toggle diagnostics' })
