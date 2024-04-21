vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    desc = 'Better mappings for netrw',
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
        end

        -- navigation
        bind('i', '<C-Up>')
        bind('j', '-<esc>')
        bind('k', '<C-Down>')
        bind('l', '<CR>')
        bind('I', '<C-u>')
        bind('K', '<C-d>')
        vim.keymap.set('v', 'mf', ':normal mf<CR>', { noremap = true, buffer = true })

        -- new file
        bind('n', '%')

        -- rename file
        bind('r', 'R')
    end
})

vim.g.netrw_sizestyle = 'H'
vim.g.netrw_liststyle = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_localmkdir = 'mkdir -p'
vim.g.netrw_localrmdir = 'rm -r'
