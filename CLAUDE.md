# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **personal dotfiles repository** managed by [Chezmoi](https://www.chezmoi.io/), containing a complete declarative system configuration for a **NixOS + Home Manager** Linux development environment. The repository handles all configuration for applications, CLI tools, and system settings through version-controlled Nix declarations.

## Key Architecture

### Nix Flakes Configuration
The system configuration is managed through Nix Flakes with a modular structure:

- **`dot_config/home-manager/flake.nix`** - Central flake configuration with pinned inputs (nixpkgs, home-manager, spicetify-nix, battery-notifier)
- **`dot_config/home-manager/configuration.nix`** - NixOS system-level configuration (hardware, boot, network, sound with PipeWire, libinput, CPU frequency scaling)
- **`dot_config/home-manager/home.nix`** - Home Manager user-level environment (packages, programs, services)

**Flake Inputs & Outputs:**
- Inputs pinned to `nixpkgs` and `home-manager` for reproducibility
- Outputs: NixOS system config + Home Manager standalone configuration
- Target system: `x86_64-linux`

### Home Manager Modular Organization
Configuration split across subdirectories under `dot_config/home-manager/`:
- **`cli-tools/`** - bat, git, neovim, tmux, yazi
- **`software/`** - firefox, gimp, mpv, spotify
- **`system/`** - bluetooth, hyprland (Wayland compositor), hyprpaper (wallpaper)
- **`notifications/`** - battery-notifier, dunst
- **`fonts.nix`**, **`shell.nix`**, **`hardware-configuration.nix`**

### Neovim Configuration
Located in `dot_config/nvim/` with Lua-based plugin management via **Lazy.nvim**:

**Core structure:**
- `init.lua` - Entry point requiring: keymaps, options, events, configs
- `options.lua` - Editor settings (tabs, indentation, clipboard, UI)
- `keymaps.lua` - Keybindings (leader key commands)
- `autocmds.lua` - Autocommands
- `events.lua` - Event handling

**Plugin categories (26+ files in `lua/plugins/`):**
1. **AI & Coding**: claude-code, avante, codecompanion, copilot
2. **LSP**: lspconfig (lua-ls, nil, pyright, typescript-language-server, vscode-langserver)
3. **Code Quality**: conform (formatting), none-ls (linting)
4. **Navigation**: flash, vim-tmux-navigator, yazi integration
5. **UI**: catppuccin theme, lualine (statusline), whichkey (command palette), fidget (LSP notifications)
6. **Editing**: treesitter (syntax), gitsigns (git), render-markdown, mini (utilities), blink (completion)
7. **Utilities**: chezmoi, hardtime, session persistence, snacks

**LSP Servers Configured:**
- Lua: lua-ls with custom workspace settings
- Nix: nil_ls
- Python: pyright
- TypeScript/JavaScript: ts_ls
- VSCode utilities: vscode-langserver

### Theming & Visual Design
**Catppuccin Mocha** color scheme applied consistently across:
- Neovim (catppuccin plugin)
- Terminal: Kitty, bat, yazi, zathura
- System: dunst, OBS Studio
- UI: waybar (taskbar), wofi (app launcher)

### System Tools & Environment
**Desktop Environment:**
- **Compositor**: Hyprland (Wayland)
- **Shell**: Fish shell with aliases and conda integration
- **Terminal**: Kitty (GPU-accelerated)
- **File Manager**: Yazi (terminal), Wofi (app launcher)

**Development Tools:**
- **Build**: gcc, gnumake
- **Version Control**: git (configured with user: Adam Bisinella), lazygit
- **Languages**: Python3, Node.js, Rust (cargo), Lua (luajit + luarocks)
- **System**: chezmoi (dotfile management), zoxide (smart cd), fzf, ripgrep, eza, fd, entr
- **AI Integration**: claude-code, claude-code-acp (Anthropic CLI tools)

**Media & Productivity:**
- mpv (media player), OBS Studio (recording), Blender (3D)
- Obsidian (notes), Zathura (PDF viewer)
- Discord, Spotify (with Spicetify)

## Common Development Commands

### System Configuration Management
```bash
# Apply Home Manager changes
home-manager switch

# Check for generation history
home-manager generations

# Update flake inputs to latest versions
nix flake update

# Check syntax of Nix files
nix flake check
```

### Neovim Development
```bash
# Neovim is configured via Lua. Key entry point:
# dot_config/nvim/init.lua

# Neovim doesn't require a build step - changes take effect on reload
# Use :source or reload the entire editor (:quit and reopen)

# Check Nix LSP configuration:
# dot_config/home-manager/cli-tools/neovim.nix (lsp packages and lua-ls settings)
```

### Code Formatting & Linting
**Formatting:**
- Nix files: `nixfmt` (configured in Home Manager)
- Lua files: `stylua` (configured in Home Manager)
- Other formats: prettier (JS), ruff (Python) via LSP

**Linting:**
- Integrated via None-ls in Neovim
- Conform.nvim handles formatting on save

### Dotfile Management
```bash
# Chezmoi commands (configured files are in dot_* directories):
chezmoi status          # Show what would change
chezmoi apply           # Apply changes to actual home directory
chezmoi add <file>      # Add new dotfile to management
chezmoi edit <file>     # Edit managed dotfile
```

## File Structure Reference

**Important paths:**
- System config: `dot_config/home-manager/`
- Neovim config: `dot_config/nvim/`
- Shell config: `dot_config/fish/`
- Git config: `dot_config/home-manager/cli-tools/git.nix`
- Wayland/Hyprland: `dot_config/hypr/`
- Theme/UI: `dot_config/{kitty,waybar,wofi,yazi}/`
- Nix packages: `dot_local/share/fonts/` (fonts)

## Code Style Standards

From `.editorconfig`:
- **Line endings**: LF
- **Charset**: UTF-8
- **Indentation**:
  - JSON/Nix/Markdown/Ruby: 2 spaces
  - Python/Perl: 4 spaces
  - Bash/Shell: 2 spaces
- **Trailing whitespace**: Trimmed (except binaries, patches, lock files)

## Important Configuration Notes

### Nix Flake Reproducibility
- `flake.lock` locks all input versions - commit this file to maintain reproducibility
- Run `nix flake update` carefully as it updates all inputs
- Test changes with `nix flake check` before committing

### Wayland/Hyprland Considerations
- System uses **Wayland** via Hyprland (not X11)
- This affects clipboard, input handling, and some tool compatibility
- Configuration: `dot_config/hypr/hyprland.conf` and `hyprlock.conf`

### AI Integration
Recent additions focus on AI-assisted coding:
- **Claude Code**: Primary integration with keybindings in Neovim
- **Avante.nvim & CodeCompanion**: Alternative AI tools configured
- **GitHub Copilot**: Also available as fallback
- Check `dot_config/nvim/lua/plugins/ai.*.lua` for per-tool configuration

### Home Manager State
- User state version: 25.11
- Home Manager manages: packages, services, dotfiles, environment variables
- Services run at user level (not system level)

## Key Decision Points for Modifications

1. **Adding a new package**: Edit `dot_config/home-manager/home.nix` (90+ packages already listed)
2. **Adding a Neovim plugin**: Create new file in `dot_config/nvim/lua/plugins/` following existing patterns, add to Lazy specs
3. **New CLI tool configuration**: Create new file in `dot_config/home-manager/cli-tools/` or add to existing tool config
4. **System-level change**: Modify `dot_config/home-manager/configuration.nix` (not home.nix)
5. **New shell aliases/functions**: Edit `dot_config/fish/aliases.fish` or `config.fish`
6. **Wayland/compositor changes**: Edit `dot_config/hypr/hyprland.conf`

## Recent Changes & Active Development Areas

Latest commits show ongoing work in:
- Claude Code integration in Neovim (most active area)
- Neovim plugin management and configuration
- NixOS system setup on new hardware
- Removal of outdated tool configurations

This indicates an actively maintained, evolving personal development environment with emphasis on AI-assisted development workflows.
