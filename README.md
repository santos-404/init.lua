# Neovim Configuration

My personal Neovim setup. Of course this configuration is heavily opinionated and built around the languages I work with and the workflow I prefer. Feel free to use it as a base, but expect to tweak things.

## Installation

```bash
git clone https://github.com/santos-404/init.lua ~/.config/nvim
cd ~/.config/nvim
```

From here you have two options:

### Option A; Automated

```bash
./setup.sh
```

The script installs packer.nvim if needed and runs `:PackerSync` headlessly. LSPs are not installed automatically you can refer to [SETUP.md](SETUP.md) for details on that.

### Option B; Manual

Follow [SETUP.md](SETUP.md) step by step.

---

## Finding your way around

**Keybindings**: `lua/javsanmar5/remap.lua` for general mappings. Plugin-specific ones live next to their setup in `after/plugin/`.

**Plugins**: add or remove from `lua/javsanmar5/packer.lua`, then run `:PackerSync`.

**Editor settings**: `lua/javsanmar5/set.lua`. Things like tab size, line numbers, clipboard, scroll offset. Nothing fancy, just the usual vim options.

**LSP keybindings and completion**: all in `after/plugin/lsp.lua`. That's also where you toggle which servers are active.

**Adding a new LSP**: drop a config file in `lsp/` (look at the existing ones, they're tiny) and add a `vim.lsp.enable('name')` line in `after/plugin/lsp.lua`.
