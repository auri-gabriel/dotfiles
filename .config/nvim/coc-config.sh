#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails


# Install NVM (Node Version Manager) if not already installed
if ! command -v nvm &> /dev/null; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Install the latest version of Node.js
if ! command -v node &> /dev/null; then
    nvm install node
fi

# Use package feature to install coc.nvim

# for vim8
#mkdir -p ~/.vim/pack/coc/start
#cd ~/.vim/pack/coc/start
#curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
# for neovim
#mkdir -p ~/.local/share/nvim/site/pack/coc/start
#cd ~/.local/share/nvim/site/pack/coc/start
#curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-rust-analyzer
npm install coc-json
npm install coc-html
npm install coc-css 
