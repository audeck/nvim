local function set_theme(theme)
	theme = theme or 'melange'
	vim.cmd.colorscheme(theme)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.opt.termguicolors = true

-- Available color schemes:
    -- melange
    -- tender
    -- catppuccin
set_theme('catppuccin')

function ColorMyPencils(theme)
    set_theme(theme)
end
