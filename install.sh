#!/usr/bin/env bash
# ==============================================================================
# Catppuccin Mocha Dotfiles Installer for Gnome
# ==============================================================================

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

log_info() {
  printf "\033[1;34m[INFO]\033[0m %s\n" "$1"
}

log_pass() {
  printf "\033[1;32m[PASS]\033[0m %s\n" "$1"
}

deploy_copy() {
  local source_path="$1"
  local target_path="$2"
  mkdir -p "$(dirname "$target_path")"
  cp -a "$source_path" "$target_path"
  log_pass "Deployed: $target_path"
}

main() {
  log_info "Deploying Catppuccin Mocha dotfiles..."

  # Ghostty
  deploy_copy "$DOTFILES_DIR/ghostty/config.ghostty" "$CONFIG_DIR/ghostty/config.ghostty"
  if [ -d "$DOTFILES_DIR/ghostty/themes" ]; then
    mkdir -p "$CONFIG_DIR/ghostty/themes"
    cp -a "$DOTFILES_DIR/ghostty/themes/"* "$CONFIG_DIR/ghostty/themes/"
    log_pass "Deployed: $CONFIG_DIR/ghostty/themes"
  fi

  # Starship
  deploy_copy "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"

  # VS Code
  deploy_copy "$DOTFILES_DIR/vscode/settings.json" "$CONFIG_DIR/Code/User/settings.json"

  # Neovim
  deploy_copy "$DOTFILES_DIR/nvim/init.lua" "$CONFIG_DIR/nvim/init.lua"
  mkdir -p "$CONFIG_DIR/nvim/lua/config" "$CONFIG_DIR/nvim/lua/plugins"
  cp -a "$DOTFILES_DIR/nvim/lua/config/"* "$CONFIG_DIR/nvim/lua/config/"
  cp -a "$DOTFILES_DIR/nvim/lua/plugins/"* "$CONFIG_DIR/nvim/lua/plugins/"
  log_pass "Deployed: $CONFIG_DIR/nvim configuration"

  # Bat
  deploy_copy "$DOTFILES_DIR/bat/config" "$CONFIG_DIR/bat/config"

  # Btop
  deploy_copy "$DOTFILES_DIR/btop/btop.conf" "$CONFIG_DIR/btop/btop.conf"
  mkdir -p "$CONFIG_DIR/btop/themes"
  cp -a "$DOTFILES_DIR/btop/themes/"* "$CONFIG_DIR/btop/themes/"
  log_pass "Deployed: $CONFIG_DIR/btop/themes"

  # Yazi
  deploy_copy "$DOTFILES_DIR/yazi/theme.toml" "$CONFIG_DIR/yazi/theme.toml"
  if [ -f "$DOTFILES_DIR/yazi/package.toml" ]; then
    deploy_copy "$DOTFILES_DIR/yazi/package.toml" "$CONFIG_DIR/yazi/package.toml"
  fi
  if [ -d "$DOTFILES_DIR/yazi/flavors" ]; then
    mkdir -p "$CONFIG_DIR/yazi/flavors"
    cp -a "$DOTFILES_DIR/yazi/flavors/"* "$CONFIG_DIR/yazi/flavors/"
    log_pass "Deployed: $CONFIG_DIR/yazi/flavors"
  fi

  # GTK 4.0 / Libadwaita
  if [ -f "$DOTFILES_DIR/gtk-4.0/gtk.css" ]; then
    deploy_copy "$DOTFILES_DIR/gtk-4.0/gtk.css" "$CONFIG_DIR/gtk-4.0/gtk.css"
  fi

  # GTK 3.0
  if [ -f "$DOTFILES_DIR/gtk-3.0/gtk.css" ]; then
    deploy_copy "$DOTFILES_DIR/gtk-3.0/gtk.css" "$CONFIG_DIR/gtk-3.0/gtk.css"
  fi

  # GNOME Shell Theme
  local data_dir="${XDG_DATA_HOME:-$HOME/.local/share}"
  if [ -f "$DOTFILES_DIR/gnome-shell/gnome-shell.css" ]; then
    deploy_copy "$DOTFILES_DIR/gnome-shell/gnome-shell.css" "$data_dir/themes/Catppuccin-Mocha-TopBar/gnome-shell/gnome-shell.css"
  fi

  # GNOME Settings
  if command -v dconf >/dev/null 2>&1; then
    dconf write /org/gnome/shell/extensions/user-theme/name "'Catppuccin-Mocha-TopBar'" || true
    log_pass "Configured GNOME Shell User Theme"
  fi

  if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' || true
    gsettings set org.gnome.desktop.interface accent-color 'purple' || true
    log_pass "Configured GNOME interface dark mode and purple accent"
  fi

  log_pass "All Catppuccin Mocha configs deployed successfully!"
}

main "$@"
