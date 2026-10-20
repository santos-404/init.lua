# Setup details

## Requirements

- Neovim 0.12+ and Git.
- A C compiler, make, curl and unzip for plugin/tool installation.
- Tree-sitter CLI 0.26.1+ for installing parsers with current nvim-treesitter.
- `ripgrep` and `fd` for Telescope searches.
- `wl-clipboard` for Fedora KDE Wayland clipboard integration; `xclip` for X11.
- Node/npm, Go and other runtimes as required by your chosen language servers.

The companion dotfiles package installer covers the Fedora prerequisites.

## Plugins

Run `bash setup.sh` from this checkout. For manual bootstrap:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/packer/start/packer.nvim"
```

Then start Neovim and run `:PackerSync`. Missing-plugin errors can appear until
that first sync finishes; the automated bootstrap avoids loading those settings
prematurely. Restart Neovim after installation.

Generated Packer files must not be copied between macOS and Linux because they
contain absolute paths. Each machine generates its own.

## Language servers

This config uses **Mason and mason-lspconfig**, with automatic enabling of installed
servers, plus native Neovim overrides under `lsp/`. Run `:Mason` to choose servers.
Examples include `gopls`, `python-lsp-server`, `typescript-language-server` and
`omnisharp`. .NET servers require a compatible .NET SDK installed separately.
The custom Crashdummyy registry is retained from the existing local setup.

For a server installed outside Mason, ensure its executable is on `PATH` and
explicitly enable its config, for example `vim.lsp.enable('gopls')`.
Use `:checkhealth vim.lsp` and `:checkhealth mason` to diagnose missing runtimes.
Avoid system-wide `pip install`; use Mason or a dedicated virtual environment
for Python language tools.

## Syntax parsers

Run `:TSInstall lua python go javascript typescript tsx html css c_sharp` for the
languages you use. Compiler and Tree-sitter CLI availability are required.
Parsers are installed per machine, not stored in this repo.

## Appearance and platform notes

Omarchy theme detection is optional and falls back to Gruvbox on Fedora KDE and
macOS. Terminal transparency depends on your terminal/compositor settings.
Use a Nerd Font in the terminal for all decorative glyphs. Ghostty bundles a
suitable default font; other terminals may need a font installed and selected.
Fedora KDE's global desktop theme and gaming setup are outside this repo.
