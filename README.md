# Neovim Configs

Everything was written from scratch, and I've tried to provide helpful comments in the event I want to refactor my configurations after I learn more.
The benefit, however, is that it does make things a little more user-friendly if someone does feel inclined to install. 

Currently this is working for me, and whilst I've got tree-sitter configured to auto-install for syntax highlighting, the LSP I've installed is taliored to Python development.
I currently manage my plugins using [lazy.nvim](https://lazy.folke.io/).

## Install

### Pre-requisites
* Nerd Font as your terminal font.
    * Make sure the nerd font you set doesn't end with Mono to prevent small icons. <br/>
      _Example : JetbrainsMono Nerd Font and not JetbrainsMono Nerd Font Mono_

* Ripgrep is required for grep searching with Telescope (OPTIONAL).

### Run:
```shell
git clone https://github.com/m0ddr/nvim ~/.config/nvim && nvim
```
## Screenshot:
![Screenshot From 2025-04-13 22-12-39](https://github.com/user-attachments/assets/dc45ae57-48e2-4ec4-836e-4709fa138187)
