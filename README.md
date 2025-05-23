
# **🚀 Neovim Configuration**

  

Welcome to my personal Neovim configuration — a fast, minimal, and modern setup designed for performance and productivity. Built using Lazy.nvim 💤, it features a curated set of plugins including Snacks for a custom dashboard, Oil for intuitive file navigation, and powerful LSP, formatting, and coding tools out of the box. Whether you're writing code, managing projects, or customizing your workflow, this config aims to give you a seamless and responsive editing experience.

  
  

Before setting up and using this Neovim configuration, ensure that you have the following prerequisites 📦 installed:

  

## 📦 Prerequisites

### 1. **Neovim**

- Version: **0.8** or higher.

- Neovim is required to run the configuration properly, as it leverages advanced features available in recent versions.

- Install Neovim via [Homebrew 🍺](https://brew.sh/):
```bash
	brew install neovim
```


### 2. **Font (Optional but Recommended)**

- To improve the appearance of your Neovim setup, it's recommended to use a **Nerd Font** for better icon and status line support.

- You can download Nerd Fonts from [here](https://www.nerdfonts.com/).

- Once downloaded, set the font in your terminal settings.

  

### 3. **Terminal Emulator**

- This setup works best with **WezTerm**, which I use for its rich feature set, including GPU acceleration and easy customization.

- **Alternative terminal emulators** that work well with this configuration include:

- **Kitty**: Known for its performance and GPU rendering.

- **Alacritty**: Lightweight and fast with GPU acceleration.

- **Warp**: A modern, feature-rich terminal with enhanced collaboration features.

- Install **WezTerm** via [Homebrew 🍺](https://brew.sh/):

```bash

	brew install --cask wezterm

```

# 🚀 Getting Started

*Follow the steps below to set up this Neovim configuration on your system.*


- (Optional) Backup Your Current Neovim Setup
```bash
	mv ~/.config/nvim ~/.config/nvim.backup
	mv ~/.local/share/nvim ~/.local/share/nvim.backup
```
- Clone This Configuration
```bash
	git clone https://github.com/kirulegion/Nvim_Config.git
```
- Start Neovim 💤
```bash
	nvim
```

# Features 
-   **🖥️ Lazy.nvim Plugin Manager**: Automatically installs and manages all plugins.
 
-   **🧑‍💻 LSP Support**: Out-of-the-box language server integration for a smooth coding experience.
 
-   **🔍 Treesitter Syntax Highlighting**: Advanced syntax highlighting for better code readability.
 
-   **📂 Oil File Explorer**: An intuitive file explorer for easy navigation.

-   **💡 Smart Autocompletion**: Get context-aware suggestions while you code.
