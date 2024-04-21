return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                integrations = {
                    harpoon = true,
                    navic = true,
                    mason = true,
                    treesitter = true,
                    telescope = { enabled = true },
                    which_key = true,
                }
            })
        end,
    },

    {
        "savq/melange-nvim",
        name = "melange",
        priority = 1000,
    },

    {
        "jacoborus/tender.vim",
        name = "tender",
        priority = 1000,
    },
}
