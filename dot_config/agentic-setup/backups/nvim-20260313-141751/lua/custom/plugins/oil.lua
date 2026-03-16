-- Oil.nvim - A file explorer that lets you edit your filesystem like a buffer
return {
  'stevearc/oil.nvim',
  opts = {
    view_opts = {
      show_hidden = true,
    },
  },
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
}
