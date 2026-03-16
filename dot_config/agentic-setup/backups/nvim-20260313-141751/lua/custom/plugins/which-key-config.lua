-- which-key configuration - add custom key group labels
return {
  'folke/which-key.nvim',
  optional = true,
  opts = function(_, opts)
    -- Extend the spec with custom groups
    opts.spec = opts.spec or {}
    table.insert(opts.spec, { '<leader>x', group = '[X]codebuild', mode = { 'n', 'v' } })
    return opts
  end,
}
