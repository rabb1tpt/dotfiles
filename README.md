# Dotfiles

Personal configuration files for development tools and applications, organized by application and managed with GNU Stow.

## Philosophy

### Decision-Making Framework

1. **When in doubt, ask** - Never proceed if not 100% sure
2. **Expose all assumptions** - Make assumptions visible and challengeable
3. **Solution tier selection** - Always present Antifragile/Robust/Quick Hack options, never default to quick hacks

### Naming Conventions

Filenames should be immediately understandable without opening the file. Use descriptive names with content-type suffixes (e.g., `-goals`, `-challenges`, `-config`).

## Structure

```
dotfiles/
├── claude-code/         # Claude Code CLI configuration
│   └── .config/
│       └── claude-code/
│           ├── memory.md    # Global preferences and decision-making framework
│           └── config.json  # MCP server configurations
├── hyprland/            # Hyprland window manager configuration
│   └── .config/
│       └── hypr/
│           └── hyprland.conf
├── waybar/              # Waybar status bar configuration
│   └── .config/
│       └── waybar/
│           ├── config              # Default theme (JSON)
│           ├── config.matrix       # Matrix theme (JSON)
│           ├── style.css           # Default theme styles
│           ├── style.matrix.css    # Matrix theme styles
│           └── scripts/
│               ├── bluetooth-toggle.sh
│               └── switch-theme.sh
├── README.md
├── .gitignore
└── install.sh
```

Each top-level directory (e.g., `claude-code/`) is a "package" that mirrors your home directory structure. This makes it easy to selectively install configurations using GNU Stow.

## Installation

### Prerequisites

Install GNU Stow (if not already installed):

```bash
# Ubuntu/Debian
sudo apt install stow

# macOS
brew install stow

# Arch Linux
sudo pacman -S stow
```

### Quick Start

1. Clone this repository:
```bash
cd ~/Bruno/code
git clone <your-repo-url> dotfiles
# or if already cloned, just cd into it
cd dotfiles
```

2. Backup existing configurations (recommended):
```bash
# Backup Claude Code config
cp -r ~/.config/claude-code ~/.config/claude-code.backup
```

3. Install configurations using Stow:
```bash
# Install all packages
./install.sh

# Or install specific packages
cd ~/Bruno/code/dotfiles
stow -t ~ claude-code
```

This creates symlinks from your home directory to the dotfiles repository. For example:
- `~/.config/claude-code/memory.md` → `~/Bruno/code/dotfiles/claude-code/.config/claude-code/memory.md`

### Verify Installation

```bash
# Check that symlinks are created
ls -la ~/.config/claude-code/

# Should show symlinks pointing to ~/Bruno/code/dotfiles/claude-code/.config/claude-code/
```

## Usage

### Making Changes

Since files are symlinked, you can edit either:
- The file in your home directory: `~/.config/claude-code/memory.md`
- The file in the repo: `~/Bruno/code/dotfiles/claude-code/.config/claude-code/memory.md`

Both point to the same file. Changes are automatically tracked by git.

### Committing Changes

```bash
cd ~/Bruno/code/dotfiles
git add .
git commit -m "Update Claude memory preferences"
git push
```

### Adding New Applications

1. Create a new package directory:
```bash
mkdir -p ~/Bruno/code/dotfiles/git/.config
```

2. Add your config files (mirroring home directory structure):
```bash
# For ~/.gitconfig
cp ~/.gitconfig ~/Bruno/code/dotfiles/git/.gitconfig

# Or for ~/.config/git/config
cp ~/.config/git/config ~/Bruno/code/dotfiles/git/.config/git/config
```

3. Stow the new package:
```bash
cd ~/Bruno/code/dotfiles
stow -t ~ git
```

### Uninstalling

To remove symlinks and restore original files:

```bash
cd ~/Bruno/code/dotfiles
stow -D -t ~ claude-code  # Removes claude-code symlinks
```

Then restore from backup if needed:
```bash
cp -r ~/.config/claude-code.backup ~/.config/claude-code
```

## Current Packages

### claude-code

Global Claude Code CLI configuration including:
- **memory.md**: Preferences, decision-making framework, naming conventions
- **config.json**: MCP server configurations (e.g., jailbreak-lanes)

Key preferences:
- Intuitive filename conventions
- Decision-making framework (ask/expose/tier-selection)
- No magic decisions, always clarify
- Antifragile solution approach

### hyprland

Hyprland window manager configuration:
- **hyprland.conf**: Main configuration file with keybindings, window rules, and visual settings

Key features:
- Arrow key window focus navigation (SUPER + arrows)
- Window resize with +/- keys (SUPER + =/-)
- Custom application launchers (terminal, browser, Slack, etc.)
- Workspace management (1-10)
- Beautiful animations and blur effects

### waybar

Waybar status bar configuration with multi-theme support:

- **config** / **style.css**: Default theme — dark background (`#1a1b26`), blue/purple accent palette
- **config.matrix** / **style.matrix.css**: Matrix theme — near-black background, full green palette
  - Background: `rgba(0,5,2,0.92)`
  - Active/highlight: `#00FF41` (classic Matrix green)
  - Standard text: `#008F11` · CPU: `#39FF14` · Memory: `#00CC44` · Audio: `#7FFF00`
  - Battery warning: `#CCFF00` · Critical/disconnected: `#FF0000`
  - Clock shows seconds (`>_ HH:MM:SS`), window titles prefixed with `// `
- **scripts/switch-theme.sh**: Switches between themes, updates symlinks, restarts waybar

#### Switching themes

```bash
# Interactive picker (requires fzf)
~/.config/waybar/scripts/switch-theme.sh

# Direct switch
~/.config/waybar/scripts/switch-theme.sh matrix
~/.config/waybar/scripts/switch-theme.sh default
```

#### Adding a new theme

1. Add `config.<name>` and `style.<name>.css` to `waybar/.config/waybar/`
2. Register it in the `THEMES` map inside `switch-theme.sh`:
   ```bash
   ["mytheme"]="config.mytheme|style.mytheme.css"
   ```
3. Switch to it with `switch-theme.sh mytheme`

## Resources

- [GNU Stow Documentation](https://www.gnu.org/software/stow/)
- [dotfiles.github.io](https://dotfiles.github.io/) - Community guide to dotfiles
- [Managing Dotfiles with Stow](https://dev.to/crafts69guy/how-to-manage-your-dotfiles-like-a-pro-with-git-and-stow-3pg1)

## Security

**Never commit sensitive information** like:
- API tokens or passwords
- SSH keys
- AWS credentials
- Database connection strings

Use `.gitignore` to exclude sensitive files, or use tools like `git-crypt` or `chezmoi` for encrypted secrets management.
