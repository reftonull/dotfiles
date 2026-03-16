-- Markdown configuration - wrapped line navigation
return {
  -- This is a "fake" plugin spec that just runs setup code
  -- We use the dir = vim.fn.stdpath 'config' trick to make it a valid plugin
  dir = vim.fn.stdpath 'config',
  name = 'markdown-config',
  config = function()
    -- Navigate wrapped lines with j/k in markdown files
    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Go up and down wrapped lines',
      pattern = 'markdown',
      callback = function()
        vim.keymap.set('n', 'j', 'gj', { buffer = true, noremap = true })
        vim.keymap.set('n', 'k', 'gk', { buffer = true, noremap = true })
      end,
    })
  end,
}
