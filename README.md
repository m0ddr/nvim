# Neovim Configs
This is my personal attempt at a minimal and performance-focused Neovim setup built from scratch with sensible defaults and essential plugins for modern development. As I'm primarily a Python dev, this configuration is optimized for Python development with LSP support for pyright and ruff. Lua and Rust are also installed without LSP support as I also dabble with these languages on occassion.

I currently manage my plugins using [lazy.nvim](https://lazy.folke.io/).

## Install

### Pre-requisites
* Neovim 0.9+

* Nerd Font as your terminal font.
    * Make sure the nerd font you set doesn't end with Mono to prevent small icons. <br>
      _Example : JetbrainsMono Nerd Font and not JetbrainsMono Nerd Font Mono_
* Lazygit is required for lazygit integration

* Ripgrep is required for grep searching with Telescope (OPTIONAL).
### Run:
```shell
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.backup &&
git clone https://github.com/m0ddr/nvim ~/.config/nvim
```
This will create a backup of any pre-existing nvim config

## Customization

- **Plugins**: Add new plugins in `lua/plugins/`
- **Keymaps**: Modify `lua/mappings.lua`
- **Options**: Adjust `lua/options.lua`
- **LSP**: Configure servers in `lua/plugins/lsp-config.lua`
