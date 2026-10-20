#!/usr/bin/env bash
# Bootstrap plugins without loading after/plugin before they exist.
set -euo pipefail
NVIM_DOTFILES="$(cd "$(dirname "$0")" && pwd)"
export NVIM_DOTFILES
PACKER_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/packer/start/packer.nvim"

command -v git >/dev/null || { echo 'Install git first.' >&2; exit 1; }
command -v nvim >/dev/null || { echo 'Install Neovim 0.12+ first.' >&2; exit 1; }
nvim --headless -u NONE -c "lua if vim.fn.has('nvim-0.12') == 0 then vim.cmd('cquit 1') end" -c qa || {
    echo 'This configuration requires Neovim 0.12+ (current Treesitter API).' >&2
    exit 1
}

if [ ! -d "$PACKER_PATH" ]; then
    mkdir -p "$(dirname "$PACKER_PATH")"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_PATH"
fi

# Load only the plugin declaration. The normal config requires installed plugins.
# Bound network stalls so unattended setup cannot hang indefinitely.
nvim --headless -u NONE \
    -c 'lua vim.opt.runtimepath:prepend(vim.env.NVIM_DOTFILES)' \
    -c "lua vim.api.nvim_create_autocmd('User', { pattern = 'PackerComplete', callback = function() vim.cmd('qa!') end }); vim.defer_fn(function() vim.cmd('cquit 1') end, 300000); require('santos-404.packer'); require('packer').sync()"

# Packer may report clone failures without a nonzero exit. Compile the local
# loader, then check the installation paths it records before returning success.
nvim --headless -u NONE \
    -c 'lua vim.opt.runtimepath:prepend(vim.env.NVIM_DOTFILES)' \
    -c "lua vim.api.nvim_create_autocmd('User', { pattern = 'PackerCompileDone', callback = function() local ok, err = pcall(function() assert(_G.packer_plugins and next(_G.packer_plugins), 'No plugins compiled'); for name, plugin in pairs(_G.packer_plugins) do assert(vim.fn.isdirectory(plugin.path) == 1, 'Plugin not installed: ' .. name) end end); if not ok then print(err); vim.cmd('cquit 1') else vim.cmd('qa!') end end }); vim.defer_fn(function() vim.cmd('cquit 1') end, 30000); require('santos-404.packer'); require('packer').compile()"

printf '\nPlugins installed. Start nvim and use :Mason for language servers.\n'
