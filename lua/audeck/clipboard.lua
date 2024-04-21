-- System (WSL) clipboard integration
if vim.fn.has("wsl") == 1 then
    -- Awful performance for SOME reason (looking at you, Microsoft)
    vim.g.clipboard = {
        name = 'win32yank-wsl',
        copy = {
            ['+'] = 'win32yank.exe -i --crlf',
            ['*'] = 'win32yank.exe -i --crlf'
        },
        paste = {
            ['+'] = 'win32yank.exe -o --lf',
            ['*'] = 'win32yank.exe -o --lf'
        },
        cache_enabled = true,
    }

    -- NOTE: WslClipboard is REALLY slow!
    -- vim.g.clipboard = {
    --     name = 'WslClipboard',
    --     copy = { ['+'] = 'clip.exe', ['*'] = 'clip.exe' },
    --     paste = {
    --         ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    --         ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
    --     },
    --     cache_enabled = true,
    -- }
end
