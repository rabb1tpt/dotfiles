#!/usr/bin/env bash
# Theme switcher — Waybar + Hyprland
# Usage: switch-theme.sh [matrix|default]
#        switch-theme.sh          (interactive picker with fzf)

DOTFILES="$HOME/Bruno/code/dotfiles"
WAYBAR_DOTFILES="$DOTFILES/waybar/.config/waybar"
HYPRLAND_DOTFILES="$DOTFILES/hyprland"
WAYBAR_CONF="$HOME/.config/waybar"
HYPRLAND_CONF="$HOME/.config/hypr"

# theme → "waybar_config|waybar_style|hyprland_conf"
declare -A THEMES=(
    ["default"]="config|style.css|hyprland.conf"
    ["matrix"]="config.matrix|style.matrix.css|hyprland.conf.matrix"
)

pick_theme() {
    printf '%s\n' "${!THEMES[@]}" | sort | fzf \
        --prompt="theme > " \
        --height=~10 \
        --border=rounded \
        --no-info
}

apply_theme() {
    local theme="$1"
    local entry="${THEMES[$theme]}"

    if [[ -z "$entry" ]]; then
        echo "Unknown theme: $theme"
        echo "Available: ${!THEMES[*]}"
        exit 1
    fi

    IFS='|' read -r wb_cfg wb_css hypr_conf <<< "$entry"

    # ── Waybar ────────────────────────────────────────────────────────────────
    ln -sf "$WAYBAR_DOTFILES/$wb_cfg" "$WAYBAR_CONF/config"
    ln -sf "$WAYBAR_DOTFILES/$wb_css" "$WAYBAR_CONF/style.css"

    pkill -x waybar
    sleep 0.3
    waybar &>/dev/null &
    disown

    # ── Hyprland ──────────────────────────────────────────────────────────────
    if [[ -f "$HYPRLAND_DOTFILES/$hypr_conf" ]]; then
        ln -sf "$HYPRLAND_DOTFILES/$hypr_conf" "$HYPRLAND_CONF/hyprland.conf"
        hyprctl reload
    else
        echo "Warning: hyprland config not found: $hypr_conf"
    fi

    echo "Switched to: $theme"
}

# ── Adding a new theme ────────────────────────────────────────────────────────
# 1. Add waybar files:   config.<name>  style.<name>.css  in waybar dotfiles
# 2. Add hyprland file:  hyprland.conf.<name>             in hyprland dotfiles
# 3. Register here:      ["<name>"]="config.<name>|style.<name>.css|hyprland.conf.<name>"
# 4. Run:                switch-theme.sh <name>
# ─────────────────────────────────────────────────────────────────────────────

# ── main ──────────────────────────────────────────────────────────────────────

if [[ -n "$1" ]]; then
    apply_theme "$1"
else
    if ! command -v fzf &>/dev/null; then
        echo "Usage: switch-theme.sh [${!THEMES[*]}]"
        exit 1
    fi
    chosen=$(pick_theme)
    [[ -n "$chosen" ]] && apply_theme "$chosen"
fi
