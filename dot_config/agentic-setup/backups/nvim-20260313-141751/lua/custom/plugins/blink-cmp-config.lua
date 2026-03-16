-- blink.cmp configuration - use Enter to accept, free up Tab for Supermaven
return {
  'saghen/blink.cmp',
  optional = true,
  opts = {
    keymap = {
      preset = 'enter', -- Enter accepts completion

      -- Override snippet navigation to use Ctrl+L/H instead of Tab/Shift-Tab
      -- This frees up Tab for Supermaven AI suggestions
      ['<Tab>'] = {},
      ['<S-Tab>'] = {},
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },
    },
  },
}
