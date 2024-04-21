return {
    "mbbill/undotree",

    config = function()
        vim.keymap.set("n", "<leader>z", ":UndotreeToggle<CR>")

        -- which-key
        require("which-key").register({
            ["<leader>"] = {
                z = { "Toggle undotree" },
            },
        }, { mode = "n"})
    end,
}
