#!/usr/bin/env bash

set -e

PACKER_PATH="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

echo "==> Checking packer.nvim..."
if [ ! -d "$PACKER_PATH" ]; then
    echo "    Installing packer.nvim..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_PATH"
else
    echo "    Already installed, skipping."
fi

echo "==> Running PackerSync..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo ""
echo "Done. Plugins are installed."
echo ""
echo "LSPs are not installed automatically."
echo "See SETUP.md for instructions on which ones are available and how to enable them."
