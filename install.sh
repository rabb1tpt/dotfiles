#!/usr/bin/env bash
#
# Install dotfiles using GNU Stow
#
# Usage:
#   ./install.sh              # Install all packages
#   ./install.sh claude-code  # Install specific package
#

set -e

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PACKAGES=(
  "claude-code"
  "hyprland"
)

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo -e "${RED}Error: GNU Stow is not installed.${NC}"
    echo ""
    echo "Install it with:"
    echo "  Ubuntu/Debian: sudo apt install stow"
    echo "  macOS: brew install stow"
    echo "  Arch: sudo pacman -S stow"
    exit 1
fi

# Function to install a package
install_package() {
    local package=$1

    if [ ! -d "$DOTFILES_DIR/$package" ]; then
        echo -e "${RED}Error: Package '$package' does not exist${NC}"
        return 1
    fi

    echo -e "${YELLOW}Installing $package...${NC}"

    # Use stow to create symlinks
    cd "$DOTFILES_DIR"
    if stow -t ~ "$package"; then
        echo -e "${GREEN}✓ $package installed successfully${NC}"
    else
        echo -e "${RED}✗ Failed to install $package${NC}"
        return 1
    fi
}

# Main installation logic
main() {
    echo "Dotfiles Installation"
    echo "===================="
    echo ""

    # If specific packages are provided as arguments, install only those
    if [ $# -gt 0 ]; then
        for package in "$@"; do
            install_package "$package"
        done
    else
        # Install all packages
        echo "Installing all packages..."
        echo ""
        for package in "${PACKAGES[@]}"; do
            install_package "$package"
        done
    fi

    echo ""
    echo -e "${GREEN}Installation complete!${NC}"
    echo ""
    echo "Your configuration files are now symlinked to this repository."
    echo "Any changes to files in your home directory will be reflected here."
}

main "$@"
