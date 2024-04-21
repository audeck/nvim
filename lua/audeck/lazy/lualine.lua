return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },

    config = function()
        require('lualine').setup {
            options = {
                theme = 'auto',
                -- NOTE: tmux and neovim have a heated disagreement about how wide
                --       some unicode characters (such as devicons) are, hence they
                --       are, unfortunately, disabled
                icons_enabled = false,
                section_separators = { left = '', right = '' },
                component_separators = { left = '|', right = '|' },
            },

            sections = {
                lualine_x = {
                    { 'encoding' },
                    { 'fileformat', symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' } },
                    { 'filetype' },
                },
            },
        }
    end,
}
