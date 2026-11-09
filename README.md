# Catppuccin Mocha Dotfiles & Theming

A unified, minimalist Catppuccin Mocha configuration suite for Linux & GNOME workstations.

## Included Configs

| Component | Target Location | Description |
| :--- | :--- | :--- |
| **Ghostty** | `~/.config/ghostty/config.ghostty` | Mocha palette with matching Libadwaita window chrome (`window-theme = ghostty`) |
| **Starship** | `~/.config/starship.toml` | Catppuccin Mocha prompt with right-aligned duration and custom symbols |
| **VS Code** | `~/.config/Code/User/settings.json` | Catppuccin Mocha syntax, UI chrome, and official `catppuccin-mocha` file icons |
| **Neovim (LazyVim)** | `~/.config/nvim/lua/plugins/colorscheme.lua` | LazyVim configured with authentic `#1e1e2e` Mocha base |
| **bat** | `~/.config/bat/config` | Global code syntax highlighting in Catppuccin Mocha |
| **btop** | `~/.config/btop/btop.conf` | System monitor themed with `catppuccin_mocha.theme` |
| **yazi** | `~/.config/yazi/theme.toml` | Modern terminal file manager with official `catppuccin-mocha.yazi` flavor |
| **fzf** | `fzf/fzf-mocha.zsh` | Mocha color palette tokens for `FZF_DEFAULT_OPTS` |

## Deployment

To deploy all configurations to `~/.config/`:

```bash
./install.sh
```
