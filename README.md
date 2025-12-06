# Dotfiles

My configuration files for Windows and Linux environment.

## 🛠 Environment
| OS | Terminal | Shell | Editor | Multiplexer |
| :--- | :--- | :--- | :--- | :--- |
| **Windows** | WezTerm | PowerShell | Neovim | - |
| **Linux** | GNOME Terminal?? | Bash | Neovim | tmux |

## 📂 Directory Structure

```text
~/dotfiles
├── nvim/              # Neovim config
├── wezterm/           # WezTerm config (Windows main)
├── tmux/              # tmux config (Linux main)
└── README.md
```


## 🚀 Installation
Clone the repository to your home directory and create symbolic links.

## Setup

### 🐧 Linux (Bash)

### 🪟 Windows (PowerShell Administrator) 
#### Neovim
#### WezTerm
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.wezterm.lua" -Target "$PWD\wezterm\.wezterm.lua"

## 📦 Components

### Neovim
・Plugin Manager: lazy.nvim
・Fuzzy Finder: Telescope

### tmux
・Prefix: Ctrl + b

### WezTerm


