# Neovim Configuration

This repository contains my personal Neovim setup, including plugins, key mappings, and LSP configurations. 

> I started adding doc about my config, but this doc is not mantained anymore. You can figure out by yourself how everything works :( (sorry). 

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
