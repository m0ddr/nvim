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

## Keybindings

| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `gd` | Go to definition |
| `gcc` | Toggle comment line |
| `gc` + motion | Toggle comment |
| `gc` (visual) | Toggle comment on selection |
| `<leader>la` | Code actions |
| `<leader>lf` | Format file |
| `<Tab>` / `<Shift-Tab>` | Next/previous buffer |
| `<leader>x` | Delete buffer |
| `<leader>n` | New buffer |
| `]d` / `[d` | Next/previous diagnostic |
| `<leader>q` | Open diagnostic quickfix |
| `<leader>gg` | Open lazygit |
| `<leader>gb` | Toggle git blame |
| `<leader>gp` | Preview git hunk |
| `<leader>gr` | Reset git hunk |
| `<leader>gs` | Stage git hunk |
| `]c` / `[c` | Next/previous git hunk |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fo` | Recent files/Oldfiles |
| `<leader>fh` | Help tags |
| `<leader>fe` | File browser |
| `<leader>fb` | File browser (current buffer dir) |
| `<leader>tD` | Open to-do list (project) |
| `<leader>td` | Open to-do list (global) |

