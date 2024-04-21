return {
    "folke/which-key.nvim",
    name = "which-key",
    event = "VeryLazy",

    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 1
    end,

    opts = {
        window = { border = "single", padding = { 0, 0, 0, 0 } },

        plugins = {
            spelling = {
                enabled = false,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = false,
                z = false,
                g = false,
            }
        },

        triggers = {
            "<leader>", -- plugins
            "<C-w>"     -- windows
        },
    }
}
