-- Conform.nvim configuration overrides for Swift
return {
  'stevearc/conform.nvim',
  optional = true,
  opts = function(_, opts)
    -- Add Swift formatter
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.swift = { 'swiftformat' }

    -- Extend format_on_save to skip oil buffers
    local original_format_on_save = opts.format_on_save
    opts.format_on_save = function(bufnr)
      -- Skip formatting for oil buffers
      if vim.bo[bufnr].filetype == 'oil' then
        return nil
      end

      -- Call original format_on_save if it exists
      if type(original_format_on_save) == 'function' then
        return original_format_on_save(bufnr)
      else
        return original_format_on_save
      end
    end

    return opts
  end,
}
