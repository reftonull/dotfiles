return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  opts = {
    keymap = { preset = 'enter' },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 300 },
    },
    sources = { default = { 'lsp', 'path', 'snippets' } },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  },
}
