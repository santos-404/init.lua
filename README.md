# Neovim Configuration

This repository contains my personal Neovim setup, including plugins, key mappings, and LSP configurations. 

> I started adding doc about my config, but this doc is not mantained anymore. You can figure out by yourself how everything works :( (sorry). 


## How to install it?

```bash
mkdir -p ~/.config/nvim
cd ~/.config/nvim
```

You will first need to install packer:
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

```

Then clone this on the folder nvim:
```bash
git clone https://github.com/javsanmar5/init.lua . 
```

Install everything:
```bash
nvim lua/javsanmar5/packer.lua
```
```vim
:PackerSync
```

> You might have problems with the LSPs. If you don't have one of the languages you will have to install it or remove from the ensure_installed

## Folder Structure
```
.
├── after
│   └── plugin
│       ├── colors.lua       # Theme settings
│       ├── lsp.lua          # LSP configurations
│       ├── telescope.lua    # Fuzzy finder setup
│       └── treesitter.lua   # Syntax highlighting
├── init.lua                 # Main Neovim configuration file
├── lua
│   └── javsanmar5
│       ├── init.lua         # Additional settings
│       ├── packer.lua       # Plugin manager setup
│       ├── remap.lua        # Custom key mappings
│       └── set.lua          # General settings
├── plugin
│   └── packer_compiled.lua  # Auto-generated plugin loader
└── old_setup.vim            # Backup of previous Vim setup
```

## What things can you do?
- **LSP Support** (Go, Python, JavaScript, Java, etc.)
- **Autocompletion** (via `nvim-cmp`)
- **Fuzzy Finder** (`telescope.nvim`)
- **Syntax Highlighting** (`nvim-treesitter`)
- **Git Integration** (`gitsigns.nvim`)
- **Custom Keybindings** (defined in `remap.lua`)

## Key Mappings
Some useful custom mappings:
| Keybinding    | Action                              |
|---------------|-------------------------------------|
| `<leader>go`  | Run Go program                      |
| `<leader>js`  | Run JavaScript file                 |
| `<leader>py`  | Run Python file                     |
| `<A-k>`       | Move line up                        |
| `<A-j>`       | Move line down                      |
| `<C-b>`       | Open file explorer (`:Ex`)          |
| `d`           | Delete without copying (use black hole register) |
| `x`           | Delete without copying (use black hole register) |
| `<A-k>` (visual) | Move selection up                   |
| `<A-j>` (visual) | Move selection down                 |

There are two more mappings for the Telescope plugin (/after/plugins/telescope.lua):
- `<leader>ff` - Find by file name using Telescope
- `<C-S-f>` - Open the Telescope grep tool for searching within files
