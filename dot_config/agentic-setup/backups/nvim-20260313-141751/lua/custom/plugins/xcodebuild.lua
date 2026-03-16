-- Xcodebuild.nvim - Neovim plugin for building and testing Xcode projects
return {
  'wojciech-kulik/xcodebuild.nvim',
  dependencies = {
    -- Uncomment a picker that you want to use, snacks.nvim might be additionally
    -- useful to show previews and failing snapshots.

    -- You must select at least one:
    'nvim-telescope/telescope.nvim',
    -- "ibhagwan/fzf-lua",
    'folke/snacks.nvim', -- (optional) to show previews

    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-tree.lua', -- (optional) to manage project files
    'stevearc/oil.nvim', -- (optional) to manage project files
    'nvim-treesitter/nvim-treesitter', -- (optional) for Quick tests support (required Swift parser)
  },
  config = function()
    require('xcodebuild').setup {
      -- put some options here or leave it empty to use default settings
    }

    -- Keybindings for Xcodebuild
    local keymap = vim.keymap.set

    -- Main picker and project manager
    keymap('n', '<leader>X', '<cmd>XcodebuildPicker<cr>', { desc = 'Show Xcodebuild Actions' })
    keymap('n', '<leader>xf', '<cmd>XcodebuildProjectManager<cr>', { desc = 'Show Project Manager Actions' })

    -- Build commands
    keymap('n', '<leader>xb', '<cmd>XcodebuildBuild<cr>', { desc = 'Build Project' })
    keymap('n', '<leader>xB', '<cmd>XcodebuildBuildForTesting<cr>', { desc = 'Build For Testing' })
    keymap('n', '<leader>xr', '<cmd>XcodebuildBuildRun<cr>', { desc = 'Build & Run Project' })

    -- Test commands
    keymap('n', '<leader>xt', '<cmd>XcodebuildTest<cr>', { desc = 'Run Tests' })
    keymap('v', '<leader>xt', '<cmd>XcodebuildTestSelected<cr>', { desc = 'Run Selected Tests' })
    keymap('n', '<leader>xT', '<cmd>XcodebuildTestClass<cr>', { desc = 'Run Current Test Class' })
    keymap('n', '<leader>x.', '<cmd>XcodebuildTestRepeat<cr>', { desc = 'Repeat Last Test Run' })

    -- Logs and coverage
    keymap('n', '<leader>xl', '<cmd>XcodebuildToggleLogs<cr>', { desc = 'Toggle Xcodebuild Logs' })
    keymap('n', '<leader>xc', '<cmd>XcodebuildToggleCodeCoverage<cr>', { desc = 'Toggle Code Coverage' })
    keymap('n', '<leader>xC', '<cmd>XcodebuildShowCodeCoverageReport<cr>', { desc = 'Show Code Coverage Report' })
    keymap('n', '<leader>xe', '<cmd>XcodebuildTestExplorerToggle<cr>', { desc = 'Toggle Test Explorer' })
    keymap('n', '<leader>xs', '<cmd>XcodebuildFailingSnapshots<cr>', { desc = 'Show Failing Snapshots' })

    -- Preview commands
    keymap('n', '<leader>xp', '<cmd>XcodebuildPreviewGenerateAndShow<cr>', { desc = 'Generate Preview' })
    keymap('n', '<leader>x<cr>', '<cmd>XcodebuildPreviewToggle<cr>', { desc = 'Toggle Preview' })

    -- Other commands
    keymap('n', '<leader>xd', '<cmd>XcodebuildSelectDevice<cr>', { desc = 'Select Device' })
    keymap('n', '<leader>xq', '<cmd>Telescope quickfix<cr>', { desc = 'Show QuickFix List' })
    keymap('n', '<leader>xx', '<cmd>XcodebuildQuickfixLine<cr>', { desc = 'Quickfix Line' })
    keymap('n', '<leader>xa', '<cmd>XcodebuildCodeActions<cr>', { desc = 'Show Code Actions' })
  end,
}
