#!/usr/bin/env bash
#
# MujaOS Interactive Installation Script
#
# Author: Mujahid Siyam
# License: MIT
# Repository: https://github.com/mujaxso/mujaos
#

set -e

### --- Variables --- ###
REPO_URL="https://github.com/mujaxso/mujaos.git"
INSTALL_DIR="/etc/nixos/mujaos"
BRANCH="main"

### --- Colors --- ###
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
BLUE="\033[0;34m"
NC="\033[0m"

### --- Helper Functions --- ###
info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() {
	echo -e "${RED}[ERROR]${NC} $1"
	exit 1
}
prompt() { echo -ne "${BLUE}[?]${NC} $1: "; }

### --- Preflight Checks --- ###
clear
echo -e "${GREEN}=========================================================${NC}"
echo -e "        🧩 Welcome to the MujaOS Installation Wizard"
echo -e "${GREEN}=========================================================${NC}"
echo
echo "This script will:"
echo "  • Clone the MujaOS repository"
echo "  • Configure your Git identity"
echo "  • Create a new system user"
echo "  • Apply your MujaOS configuration using NixOS flakes"
echo
read -p "Press ENTER to continue or Ctrl+C to cancel..."

if [[ $EUID -ne 0 ]]; then
	error "Please run this script as root (sudo)."
fi

if ! command -v nix &>/dev/null; then
	error "Nix is not installed. Please install Nix before continuing."
fi

### --- Gather User Input --- ###
prompt "Enter your desired Linux username"
read NEW_USER

if id "$NEW_USER" &>/dev/null; then
	warn "User '$NEW_USER' already exists. Skipping creation."
else
	prompt "Enter full name for the new user"
	read FULL_NAME

	info "Creating new system user: $NEW_USER"
	useradd -m -G wheel -s /bin/bash -c "$FULL_NAME" "$NEW_USER"
	passwd "$NEW_USER"
fi

prompt "Enter your Git username"
read GIT_USERNAME

prompt "Enter your Git email"
read GIT_EMAIL

prompt "Enter the host name to install (e.g. laptop, desktop, server)"
read HOST_NAME

### --- Configure Git for the new user --- ###
info "Configuring Git for user '$NEW_USER'..."
sudo -u "$NEW_USER" git config --global user.name "$GIT_USERNAME"
sudo -u "$NEW_USER" git config --global user.email "$GIT_EMAIL"

### --- Clone MujaOS Repository --- ###
if [ -d "$INSTALL_DIR" ]; then
	warn "Existing MujaOS directory detected at $INSTALL_DIR."
	read -p "Do you want to update it instead? [y/N]: " choice
	if [[ $choice =~ ^[Yy]$ ]]; then
		cd "$INSTALL_DIR"
		git pull origin "$BRANCH"
	else
		error "Installation aborted by user."
	fi
else
	info "Cloning MujaOS repository..."
	git clone -b "$BRANCH" "$REPO_URL" "$INSTALL_DIR"
	cd "$INSTALL_DIR"
fi

### --- Verify flake.nix presence --- ###
if [ ! -f "flake.nix" ]; then
	error "flake.nix not found in the repository. Aborting."
fi

### --- Build and Apply Configuration --- ###
info "Building and applying NixOS configuration for host: $HOST_NAME"
nixos-rebuild switch --flake ".#$HOST_NAME" --show-trace

### --- Final Message --- ###
clear
echo -e "\n${GREEN}=========================================================${NC}"
echo -e "              ✅ MujaOS Installation Complete!"
echo -e "${GREEN}=========================================================${NC}\n"
echo -e "Installation Summary:"
echo -e "  • User created:    ${YELLOW}$NEW_USER${NC}"
echo -e "  • Git username:    ${YELLOW}$GIT_USERNAME${NC}"
echo -e "  • Git email:       ${YELLOW}$GIT_EMAIL${NC}"
echo -e "  • Host configured: ${YELLOW}$HOST_NAME${NC}\n"
echo -e "${GREEN}Your system has been successfully configured with MujaOS.${NC}"
echo
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Review the configuration if needed: cd $INSTALL_DIR"
echo "  2. Reboot your system to apply all settings."
echo
read -p "Would you like to reboot now? [y/N]: " reboot_choice
if [[ $reboot_choice =~ ^[Yy]$ ]]; then
	info "Rebooting system..."
	sleep 2
	reboot
else
	info "Installation finished. You can reboot manually later with: sudo reboot"
fi
echo
