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
                block = "<C-?>",
            },

            opleader = {
                line = "<C-_>",
                block = "<C-?>",
            },

            mappings = {
                basic = true,
                extra = false,
            },

            -- Functions to call before/after (un)comment
            pre_hook = nil,
            post_hook = nil,
        })
    end,
}
