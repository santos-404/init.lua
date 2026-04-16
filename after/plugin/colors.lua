-- Map omarchy theme names to neovim colorscheme names
local theme_map = {
    ["gruvbox"]          = { colorscheme = "gruvbox" },
    ["tokyo-night"]      = { colorscheme = "tokyonight-night" },
    ["catppuccin"]       = { colorscheme = "catppuccin" },
    ["catppuccin-latte"] = { colorscheme = "catppuccin-latte" },
    ["ethereal"]         = { colorscheme = "ethereal" },
    ["everforest"]       = { colorscheme = "everforest" },
    ["flexoki-light"]    = { colorscheme = "flexoki-light" },
    ["hackerman"]        = { colorscheme = "hackerman" },
    ["kanagawa"]         = { colorscheme = "kanagawa" },
    ["lumon"]            = { colorscheme = "lumon" },
    ["matte-black"]      = { colorscheme = "matteblack" },
    ["miasma"]           = { colorscheme = "miasma" },
    ["nord"]             = { colorscheme = "nordfox" },
    ["osaka-jade"]       = { colorscheme = "bamboo" },
    ["retro-82"]         = { colorscheme = "retro-82" },
    ["rose-pine"]        = { colorscheme = "rose-pine-dawn" },
    ["vantablack"]       = { colorscheme = "vantablack" },
    ["white"]            = { colorscheme = "white" },
    ["ristretto"]        = {
        colorscheme = "monokai-pro",
        setup = function()
            require("monokai-pro").setup({ filter = "ristretto" })
        end,
    },
}

local function get_omarchy_entry()
    local theme_file = vim.fn.expand("~/.config/omarchy/current/theme.name")
    if vim.fn.filereadable(theme_file) == 1 then
        local name = vim.fn.trim(vim.fn.readfile(theme_file)[1])
        return theme_map[name]
    end
    return nil
end

function UpdateColor(color)
    local entry = color and { colorscheme = color }
        or get_omarchy_entry()
        or { colorscheme = "gruvbox" }

    if entry.setup then pcall(entry.setup) end

    local ok = pcall(vim.cmd.colorscheme, entry.colorscheme)
    if not ok then vim.cmd.colorscheme("gruvbox") end

    vim.api.nvim_set_hl(0, "Normal",               { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat",           { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr",                { fg = "#ffffff", bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn",            { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrAbove",           { fg = "#aaaaaa", bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrBelow",           { fg = "#aaaaaa", bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "#aaaaaa", bg = "NONE" })

    vim.opt.termguicolors = true
end

UpdateColor()
