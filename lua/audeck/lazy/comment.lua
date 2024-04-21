return {
    "numToStr/Comment.nvim",
    lazy = false,

    opts = {},

    config = function()
        require("Comment").setup({
            padding = true,
            sticky = true,

            toggler = {
                line = "<C-_>",
                block = "<S-C-_>",
            },

            opleader = {
                line = "<C-_>",
                block = "<S-C-_>",
            },

            extra = {},

            mappings = false,

            -- Functions to call before/after (un)comment
            pre_hook = nil,
            post_hook = nil,
        })
    end,
}
