function UpdateColor(color)
	color = color or 'tokyonight'
	vim.cmd.colorscheme(color)
	
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bg = "none" }) 
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#aaaaaa", bg = "none" }) 
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#aaaaaa", bg = "none" }) 

    -- THIS IS NOT WORKIN'. IDK WHY :(
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
end

UpdateColor()
