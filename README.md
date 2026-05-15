# dotfiles

Personal dotfiles for Ubuntu/Debian-based systems. Includes configuration for zsh, tmux, vim, and more.

## What's included

| File | Purpose |
|---|---|
| `.zshrc` | Zsh config — Oh My Zsh, Powerlevel10k theme, plugins |
| `.p10k.zsh` | Powerlevel10k prompt config (Solarized Dark colour scheme) |
| `.tmux.conf` | Tmux config — keybindings, TPM, Solarized Dark theme |
| `.vimrc` | Vim config |
| `.aliases` | Shell aliases (note: `afk`, `chromekill`, `local_ip` are macOS-only) |
| `.bashrc` / `.bash_profile` | Bash config (fallback) |

## Fresh install

### 1. Clone the repo

```bash
git clone https://github.com/ShaunParsons/dotfiles.git ~/dotfiles
```

### 2. Run the install script

```bash
cd ~/dotfiles
chmod +x .install.sh
./.install.sh
```

This will:
- Symlink all dotfiles into `$HOME`
- Install system packages (zsh, tmux, vim, etc.)
- Install Oh My Zsh with Powerlevel10k and the print-alias plugin
- Build and install Neovim from source
- Install vim-plug
- Install TPM (Tmux Plugin Manager)
- Install Docker and Docker Compose v2 (as a Docker plugin — use `docker compose`, not `docker-compose`)
- Install NVM
- Install the AWS CLI

### 3. Set zsh as your default shell

```bash
chsh -s $(which zsh)
```

Then open a new terminal. The Powerlevel10k configuration wizard will run automatically. To re-run it at any time:

```bash
p10k configure
```

### 4. Install tmux plugins

Inside a tmux session, press `Ctrl+a I` to install plugins via TPM (this pulls in the Solarized Dark theme).

## Manual steps

A few things the install script can't do automatically:

- **NVM**: After install, run `nvm install --lts` to install a Node.js version
- **Sensitive exports**: Add any private environment variables (API keys, tokens, etc.) to `~/.exports` — this file is sourced by `.zshrc` but is not tracked in the repo
