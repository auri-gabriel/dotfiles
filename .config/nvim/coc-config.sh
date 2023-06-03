#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails


# Install latest nodejs
if [ ! -x "$(command -v node)" ]; then
    curl --fail -LSs https://install-node.now.sh/latest | sh
    export PATH="/usr/local/bin/:$PATH"
    # Or use package manager, e.g.
    # sudo apt-get install nodejs
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
npm install coc-rust-analyzer --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm isntall coc-sh --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm isntall coc-yaml --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-vimtex --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
# web dev
npm install coc-html --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-css --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-tsserver --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-eslint --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-tslint --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-tslint-plugin --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-json --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
# php
npm install coc-phpls --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-blade --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
