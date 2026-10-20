# Neovim configuration

My Neovim configuration, shared between macOS and Linux (including Fedora KDE).
It uses Packer, native Neovim LSP configuration, Mason, and an optional Omarchy
theme integration. Omarchy is **not** required: other systems default to Gruvbox.

## Fedora KDE installation

Install the companion [dotfiles](https://github.com/santos-404/dotfiles) first,
following its Fedora instructions. Its package installer provides Neovim, Git,
C/C++ build tools, Node/npm, Go, ripgrep, fd, the Tree-sitter CLI and clipboard
helpers. This configuration currently requires **Neovim 0.12+** because it uses
the current `nvim-treesitter` API. Check `nvim --version` before setup.

```bash
git clone https://github.com/santos-404/init.lua "$HOME/.config/nvim"
cd "$HOME/.config/nvim"
bash setup.sh
nvim
```

If `~/.config/nvim` already exists, back it up before cloning; do not clone over
another configuration. For a custom `XDG_CONFIG_HOME`, use its `nvim` directory.
The bootstrap uses `XDG_DATA_HOME` when set.

`setup.sh` installs Packer and plugins without loading plugin-dependent settings
before installation completes. The generated `plugin/packer_compiled.lua` is
local to each machine and ignored by Git. Run setup again after pulling changes
that add plugins. Full plugin updates use `:PackerSync`.

On the first real launch, run `:checkhealth`. Use `:Mason` to install the language
servers you need; runtimes such as .NET, Java and Python are separate installs.
See [SETUP.md](SETUP.md) for details.

## Configuration layout

- `lua/santos-404/remap.lua`: general keybindings.
- `lua/santos-404/set.lua`: editor settings.
- `lua/santos-404/packer.lua`: plugins and themes.
- `after/plugin/`: plugin setup, completion and LSP keybindings.
- `lsp/`: native language-server configuration overrides.

On Omarchy the theme follows `~/.config/omarchy/current/theme.name` when present.
On Fedora/macOS, change the default in `after/plugin/colors.lua` or call
`:lua UpdateColor("tokyonight-night")` for the current session. KDE's desktop
appearance is configured separately; these repositories do not install a Plasma
global theme.
