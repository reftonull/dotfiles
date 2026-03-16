return {
  -- Snacks: notifier, dashboard, indent guides, terminal, lazygit, etc.
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      indent = { enabled = true },
      notifier = { enabled = true },
      dashboard = { enabled = true },
      terminal = { enabled = true },
      lazygit = { enabled = true },
      words = { enabled = true },
      statuscolumn = { enabled = true },
    },
    keys = {
      { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
      { '<leader>tt', function() Snacks.terminal() end, desc = 'Toggle Terminal' },
      { '<leader>n', function() Snacks.notifier.show_history() end, desc = 'Notification History' },
    },
  },

  -- Smear cursor: animated cursor trail
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
}
