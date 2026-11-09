# Catppuccin Mocha Dotfiles & Theming

A unified, minimalist Catppuccin Mocha configuration suite for Linux & GNOME workstations.

## Included Configs

| Component | Target Location | Description |
| :--- | :--- | :--- |
| **Ghostty** | `~/.config/ghostty/config.ghostty` | Mocha palette with matching Libadwaita window chrome (`window-theme = ghostty`) and home-directory tab behavior |
| **Starship** | `~/.config/starship.toml` | Catppuccin Mocha prompt with right-aligned duration and custom status arrows |
| **VS Code** | `~/.config/Code/User/settings.json` | Catppuccin Mocha syntax, UI chrome, and official `catppuccin-mocha` file icons |
| **Neovim (LazyVim)** | `~/.config/nvim/lua/plugins/colorscheme.lua` | LazyVim configured with authentic `#1e1e2e` Mocha base |
| **GTK 4 / Libadwaita** | `~/.config/gtk-4.0/gtk.css` | Native Libadwaita palette overrides (Base windows, Mantle sidebars, Mauve accents) |
| **GTK 3** | `~/.config/gtk-3.0/gtk.css` | Legacy GTK3 color definitions and matching sidebar styling |
| **GNOME Shell** | `~/.local/share/themes/Catppuccin-Mocha-TopBar/` | Zero-lag top bar, Crust (`#11111b`) overview, popover menus, and quick settings |
| **bat** | `~/.config/bat/config` | Global code syntax highlighting in Catppuccin Mocha |
| **btop** | `~/.config/btop/btop.conf` | System monitor themed with `catppuccin_mocha.theme` |
| **yazi** | `~/.config/yazi/theme.toml` | Modern terminal file manager with official `catppuccin-mocha.yazi` flavor |
| **fzf** | `fzf/fzf-mocha.zsh` | Mocha color palette tokens for `FZF_DEFAULT_OPTS` |

## Requirements

- **GNOME Shell Extension**: [User Themes](https://extensions.gnome.org/extension/19/user-themes/) (required to load custom shell stylesheets)
- **Terminal (Ghostty)**:
  ```bash
  sudo dnf copr enable -y scottames/ghostty && sudo dnf install -y ghostty
  ```

## Deployment

To deploy all configurations to your system:

```bash
./install.sh
```
