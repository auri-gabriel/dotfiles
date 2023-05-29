#!/bin/bash

# Remove existing nvm installation
rm -rf ~/.nvm

# Install packages from packages.txt using dnf
sudo dnf install -y $(cat packages.txt)

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Install the latest Node.js version
nvm install node

# Install starship
curl -sS https://starship.rs/install.sh | bash

# currently using bash to install rust is not recommended and may cause errors
# TODO find another way of installing rust
# Install Rust using sh instead of bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add Rust to the PATH
source "$HOME/.cargo/env"

# Optional: Set starship as the default shell prompt
echo 'eval "$(starship init bash)"' >> ~/.bashrc

