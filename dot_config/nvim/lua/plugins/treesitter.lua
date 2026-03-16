return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'bash', 'c', 'diff', 'html', 'json', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'query', 'swift',
        'vim', 'vimdoc', 'yaml', 'typescript', 'javascript',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = { ['<leader>ps'] = '@parameter.inner' },
            swap_previous = { ['<leader>pS'] = '@parameter.inner' },
          },
        },
      })
    end,
  },
}
