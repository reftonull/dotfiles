return {
  -- Better textobjects (va), ci', etc.)
  { 'echasnovski/mini.ai', version = false, opts = { n_lines = 500 } },

  -- Surround (saiw", sd', sr)' )
  { 'echasnovski/mini.surround', version = false, opts = {} },

  -- Auto-close brackets and quotes
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },

  -- Detect indentation automatically
  { 'NMAC427/guess-indent.nvim', opts = {} },
}
