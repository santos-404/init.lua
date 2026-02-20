# Manual Setup

## 1. Install packer.nvim

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## 2. Install plugins

Open the packer file inside Neovim and run `:PackerSync`:

```bash
nvim lua/santos-404/packer.lua
```
```vim
:PackerSync
```

Wait for it to finish, then restart Neovim.

---

## LSPs

My current LSPs configuraition use Neovim's native LSP client, no mason, no lspconfig. Each LSP has its own config file in `lsp/` and must be enabled manually in `after/plugin/lsp.lua`.

This selection is based on the languages I personally work on. It is heavily opinionated and not a recommendation for everyone. You can remove any of them, add new ones, or leave them all disabled.
With the new Neovim API for LSPs, this will not throw any errors if an LSP binary is not installed or not enabled, so you can let it be as it isif you dont want to disable anything.

**Available LSPs:**

| LSP | Language | How to install |
|-----|----------|----------------|
| `gopls` | Go | `go install golang.org/x/tools/gopls@latest` |
| `pylsp` | Python | `pip install python-lsp-server` |
| `ts_ls` | TypeScript / JavaScript | `npm i -g typescript-language-server typescript` |
| `omnisharp` | C# | [OmniSharp releases](https://github.com/OmniSharp/omnisharp-roslyn/releases) |

To enable or disable an LSP, edit `after/plugin/lsp.lua`:

```lua
-- LANGUAGES
vim.lsp.enable('gopls')
vim.lsp.enable('pylsp')
vim.lsp.enable('ts_ls')
vim.lsp.enable('omnisharp')
```

