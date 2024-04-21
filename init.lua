require("audeck.keymaps")
require("audeck.netrw")
require("audeck.clipboard")
require("audeck.settings")
require("audeck.lazy_init")
require("audeck.theme")

vim.cmd("set laststatus=3")
vim.cmd("filetype plugin on")

-- Recognize gdscript files
vim.api.nvim_exec([[
    au BufRead,BufNewFile *.gd                setfiletype gdscript
]], false)

