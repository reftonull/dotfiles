-- Harpoon - Quick file navigation
-- Option 1: Using leader + numbers (recommended)
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- Add current file to harpoon list
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [A]dd file' })

    -- Toggle harpoon menu
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon Toggle Menu' })

    -- Select files 1-4 using leader + number
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon File 1' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon File 2' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon File 3' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon File 4' })

    -- Navigate between harpoon files
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon [P]revious' })
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end, { desc = 'Harpoon [N]ext' })
  end,
}

-- Alternative Option 2: All under <leader>h namespace
-- Uncomment this and comment out Option 1 above if you prefer:
--
-- return {
--   'ThePrimeagen/harpoon',
--   branch = 'harpoon2',
--   dependencies = { 'nvim-lua/plenary.nvim' },
--   config = function()
--     local harpoon = require 'harpoon'
--     harpoon:setup()
--
--     vim.keymap.set('n', '<leader>ha', function()
--       harpoon:list():add()
--     end, { desc = 'Harpoon [A]dd file' })
--
--     vim.keymap.set('n', '<leader>hh', function()
--       harpoon.ui:toggle_quick_menu(harpoon:list())
--     end, { desc = 'Harpoon Toggle Menu' })
--
--     vim.keymap.set('n', '<leader>h1', function()
--       harpoon:list():select(1)
--     end, { desc = 'Harpoon File 1' })
--     vim.keymap.set('n', '<leader>h2', function()
--       harpoon:list():select(2)
--     end, { desc = 'Harpoon File 2' })
--     vim.keymap.set('n', '<leader>h3', function()
--       harpoon:list():select(3)
--     end, { desc = 'Harpoon File 3' })
--     vim.keymap.set('n', '<leader>h4', function()
--       harpoon:list():select(4)
--     end, { desc = 'Harpoon File 4' })
--
--     vim.keymap.set('n', '<leader>hp', function()
--       harpoon:list():prev()
--     end, { desc = 'Harpoon [P]revious' })
--     vim.keymap.set('n', '<leader>hn', function()
--       harpoon:list():next()
--     end, { desc = 'Harpoon [N]ext' })
--   end,
-- }
