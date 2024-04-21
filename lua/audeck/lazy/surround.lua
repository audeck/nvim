return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    opts = {},
    event = "VeryLazy",

    config = function()
        require("nvim-surround").setup({
            keymaps = {
                delete = "ds",
                change = "cs",
                -- change_line = "yS",
            },

            highlight = {
                duration = 10,
            },
        })
    end,
}
