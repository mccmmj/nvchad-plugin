# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on NvChad v2.5, a popular Neovim distribution. The configuration extends NvChad's base functionality with custom plugins and settings for development across multiple languages.

## Architecture

- **Plugin Management**: Uses lazy.nvim for plugin management with lazy loading
- **Base Framework**: Built on NvChad which provides the core UI, themes, and base functionality
- **Configuration Structure**:
  - `init.lua`: Main entry point, bootstraps lazy.nvim and loads NvChad
  - `lua/plugins/init.lua`: Custom plugin definitions and overrides
  - `lua/configs/`: Configuration files for various tools (LSP, formatters, linters)
  - `lua/mappings.lua`: Custom key mappings
  - `lua/options.lua`: Custom Neovim options
  - `lua/chadrc.lua`: NvChad-specific configuration

## Development Environment

### Python Setup
- Uses a virtual environment at `.venv/bin/python` for Python LSP and tools
- To activate: `source .venv/bin/activate`

### Language Servers and Tools
Configured through Mason with these tools auto-installed:
- **Python**: python-lsp-server, black, pylint, mypy, ruff
- **JavaScript/TypeScript**: typescript-language-server, eslint-lsp, eslint_d, prettier
- **C/C++**: clangd, clang-format, cpplint
- **Web**: html-lsp, css-lsp

### Key Plugins
- **LSP**: nvim-lspconfig with comprehensive language server support
- **Formatting**: conform.nvim for code formatting
- **Linting**: nvim-lint and null-ls for code linting
- **Completion**: nvim-cmp with copilot-cmp integration
- **Search**: fzf-lua and vim-grepper for enhanced search capabilities
- **AI**: ChatGPT.nvim for AI-powered coding assistance

## Configuration Management

### Adding New Plugins
Add plugins to `lua/plugins/init.lua` following the lazy.nvim specification.

### Modifying LSP Settings
Edit `lua/configs/lspconfig.lua` to configure language servers.

### Custom Key Mappings
Add mappings to `lua/mappings.lua` using the `vim.keymap.set` function.

### Theme and UI
Modify `lua/chadrc.lua` to change themes or UI settings (currently using "onedark" theme).

## Important Notes

- Configuration follows NvChad's structure - avoid modifying core NvChad files directly
- Custom configurations should be added to the `lua/` directory
- The configuration imports NvChad modules like `require "nvchad.options"`
- Lazy loading is enabled by default for better startup performance