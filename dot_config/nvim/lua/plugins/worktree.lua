return {
  'ThePrimeagen/git-worktree.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('git-worktree').setup({
      -- Default worktree directory relative to repo root
      toplevel_dir = '.trees',
    })

    -- Load telescope extension
    pcall(require('telescope').load_extension, 'git_worktree')

    vim.keymap.set('n', '<leader>gw', function()
      require('telescope').extensions.git_worktree.git_worktrees()
    end, { desc = 'Git Worktrees' })

    vim.keymap.set('n', '<leader>gc', function()
      require('telescope').extensions.git_worktree.create_git_worktree()
    end, { desc = 'Create Worktree' })
  end,
}
