return {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pa', function() builtin.find_files({ no_ignore = true }) end, {})
        vim.keymap.set('n', '<leader>pA', function() builtin.find_files({ no_ignore = true, hidden = true }) end, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup {
            defaults = {
                mappings = {
                    n = {
                        ["U"] = actions.move_to_top,
                        ["O"] = actions.move_to_bottom
                    }
                }
            }
        }

        -- which-key
        require('which-key').register({
            ['<leader>'] = {
                p = {
                    name = "[p]roject",
                    f = { "Find file" },
                    a = { "Find file (all)" },
                    A = { "Find file (ALL!) "},
                    s = { "Find string" },
                    v = { "View files" }
                }
            }
        })
    end,
}
