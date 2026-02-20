#!/usr/bin/env bash
# Waybar theme switcher
# Usage: switch-theme.sh [matrix|default]
#        switch-theme.sh          (interactive picker with fzf)

DOTFILES_WAYBAR="$HOME/Bruno/code/dotfiles/waybar/.config/waybar"
WAYBAR_CONF="$HOME/.config/waybar"

declare -A THEMES=(
    ["default"]="config|style.css"
    ["matrix"]="config.matrix|style.matrix.css"
)

pick_theme() {
    printf '%s\n' "${!THEMES[@]}" | sort | fzf \
        --prompt="waybar theme > " \
        --height=~10 \
        --border=rounded \
        --no-info
}

apply_theme() {
    local theme="$1"
    local pair="${THEMES[$theme]}"

    if [[ -z "$pair" ]]; then
        echo "Unknown theme: $theme"
        echo "Available: ${!THEMES[*]}"
        exit 1
    fi

    local cfg="${pair%%|*}"
    local css="${pair##*|}"

    ln -sf "$DOTFILES_WAYBAR/$cfg" "$WAYBAR_CONF/config"
    ln -sf "$DOTFILES_WAYBAR/$css" "$WAYBAR_CONF/style.css"

    echo "Switched to: $theme ($cfg + $css)"

    # Restart waybar
    pkill -x waybar
    sleep 0.3
    waybar &>/dev/null &
    disown
}

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
