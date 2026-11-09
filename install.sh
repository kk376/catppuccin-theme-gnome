#!/usr/bin/env bash
# ==============================================================================
# Catppuccin Mocha Dotfiles Installer
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

    log_pass "All Catppuccin Mocha configs deployed successfully!"
}

main "$@"
