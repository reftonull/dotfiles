-- SourceKit LSP - Swift language server configuration
-- SourceKit LSP comes with Xcode command line tools
-- Using new vim.lsp.config API (Neovim 0.11+)
return {
  dir = vim.fn.stdpath 'config',
  name = 'sourcekit-lsp-config',
  config = function()
    -- Setup sourcekit LSP using the new vim.lsp.config API
    -- Get capabilities from blink.cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_blink, blink = pcall(require, 'blink.cmp')
    if has_blink then
      capabilities = blink.get_lsp_capabilities(capabilities)
    end

    -- Configure sourcekit using new API (without vim.schedule)
    vim.lsp.config('sourcekit', {
      cmd = { vim.trim(vim.fn.system 'xcrun -f sourcekit-lsp') },
      filetypes = { 'swift', 'objective-c', 'objective-cpp' },
      root_markers = { 'Package.swift', '.git' },
      capabilities = capabilities,
    })

    -- Enable sourcekit for Swift files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'swift', 'objective-c', 'objective-cpp' },
      callback = function(args)
        vim.lsp.enable('sourcekit')
      end,
    })
  end,
}
