# Dotfiles — Distributions

This folder contains installation and configuration scripts for multiple Linux distributions (currently: Arch Linux and Fedora). The goal is to automate the setup of applications, fonts, development tools, and user configurations.

## Prerequisites

- Sudo access on the machine.
- Internet connection.

## Usage

1. From the `distributions` directory, run:

    ```bash
    ./setup.sh
    ```

This script detects your distribution (`pacman` → Arch, `dnf` → Fedora) and launches the appropriate setup process.

## Main Structure

- `setup.sh`: Entry script that loads the common bootstrap and selects the distribution.
- `archlinux/`: Scripts and subfolders for Arch Linux.
- `fedora/`: Scripts and subfolders for Fedora.
- `common/`: Shared scripts (e.g., webapp installation, config bootstrap).
- Each distribution contains an `install/` folder with:
  - `apps/`: CLI applications and tools installation.
  - `desktop/`: Desktop environment apps and fonts.
  - `hyprland/`, `config/`, etc. depending on the distribution.

## Customization

- Add or edit scripts in `install/apps/` or `install/desktop/` to extend the configuration.
- User configuration files are copied from `../config/` by the bootstrap — modify these sources to change deployed configs.
- Provided binaries/scripts are copied to `~/.local/bin` via `common/install/bootstrap.sh`.

## Contributing

- Add your script to the relevant distribution folder.
- Open a pull request with a clear description of what your script installs and why.

