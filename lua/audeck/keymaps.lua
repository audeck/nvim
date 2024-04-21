-- [<leader>]: mainly used to trigger plugin behavior (documented with which-keys)
vim.g.mapleader = " "

-- [<C-f>]: `indentkeys` trigger while in Insert mode
vim.g.indentkeys = "!^F"

-- [ pv]: Open netrw (file explorer)
vim.keymap.set("n", "<leader>pv", ":Ex<cr>")

-- [I]: navigate up & half-page scroll up
vim.keymap.set("", "i", "k")
vim.keymap.set("", "I", "<C-u>") -- add 'zz' after to center screen
vim.keymap.set("n", "<C-i>", ":cprev<CR>") -- prev quick fix item

-- [J]: navigate left & navigate to prev word
vim.keymap.set("", "j", "h")
vim.keymap.set("", "J", "b")

-- [K]: navigate down & half-page scroll down
vim.keymap.set("", "k", "j")
vim.keymap.set("", "K", "<C-d>")
vim.keymap.set("n", "<C-k>", ":cnext<CR>") -- prev quick fix item

-- [L]: navigate right & navigate to next word
vim.keymap.set("", "l", "l")
vim.keymap.set("", "L", "w")

-- [U]: start of line & start of file
vim.keymap.set("", "u", "^")
vim.keymap.set("", "U", "[[")

-- [O]: end of line & end of file
vim.keymap.set("", "o", "$")
vim.keymap.set("", "O", "]]")

-- [C]: copy (yank)
vim.keymap.set("", "c", 'y')
vim.keymap.set("", "C", 'Y')

-- [V]: paste before & after
vim.keymap.set("", "v", 'p')
vim.keymap.set("", "V", 'P')
vim.keymap.set("", "v", 'p')
vim.keymap.set("", "V", 'P')

-- [Q]: visual modes
vim.keymap.set("n", "q", "v")
vim.keymap.set("n", "Q", "V")
vim.keymap.set("n", "<C-q>", "<C-v>")

-- [A]: insert mode after & before
vim.keymap.set("n", "A", "i")
vim.keymap.set("n", "a", function()
    -- Send the 'a' key
    vim.api.nvim_feedkeys('a', 'n', true)

    -- If 'indentexpr' is set in the buffer, also send '<C-f>'
    -- to insert leading indentation using it
    if vim.bo.indentexpr ~= '' then
        local termcode = vim.api.nvim_replace_termcodes('<C-f>', true, true, true)
        vim.api.nvim_feedkeys(termcode, 'n', true)
    end
end)

-- [Z]: undo & redo
vim.keymap.set("n", "z", "u")
vim.keymap.set("n", "Z", "<C-r>")

-- [S]: substitute, substitute line word
vim.keymap.set("n", "s", "c")
vim.keymap.set("n", "S", "bdwi")

-- [D]: delete word
vim.keymap.set("n", "d", "d")
vim.keymap.set("n", "D", "bdw")

-- [N]: insert newline before & after
vim.keymap.set("n", "n", "o<Esc>")
vim.keymap.set("n", "N", "O<Esc>")

-- [Control + w + I/J/K/L]: window navigation
vim.keymap.set("n", "<C-w>i", "<C-w>k")
vim.keymap.set("n", "<C-w>j", "<C-w>h")
vim.keymap.set("n", "<C-w>k", "<C-w>j")
vim.keymap.set("n", "<C-w>l", "<C-w>l")

-- [Alt + i, k]: moving selected lines up & down
vim.keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-i>", ":m '<-2<CR>gv=gv")

-- [`, Control + J/L]: Go to previous buffer, go to prev/next buffer
vim.keymap.set("n", "`", "<C-^>")
vim.keymap.set("n", "<C-j>", ":bp<CR>")
vim.keymap.set("n", "<C-l>", ":bn<CR>")

-- [Tab, Shift + Tab]: Indenting in visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- [, & .]: Next/prev search candidate
vim.keymap.set("n", ",", "n")
vim.keymap.set("n", ".", "N")

-- Split/join lines
vim.keymap.set("n", ">", "a<CR><Esc>V=<Esc>^h")
vim.keymap.set("n", "<", "^d0i<BS><Esc>$w")
