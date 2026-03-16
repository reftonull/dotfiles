-- Telescope configuration overrides
return {
  'nvim-telescope/telescope.nvim',
  optional = true,
  opts = function(_, opts)
    -- Add custom mappings
    opts.defaults = opts.defaults or {}
    opts.defaults.mappings = opts.defaults.mappings or {}
    opts.defaults.mappings.i = opts.defaults.mappings.i or {}

    -- Add fuzzy refine mapping
    opts.defaults.mappings.i['<c-enter>'] = 'to_fuzzy_refine'

    return opts
  end,
}
