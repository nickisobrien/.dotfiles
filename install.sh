#!/bin/sh

brew install neovim
brew install ripgrep
brew install spotify-tui
brew install autojump
brew install --cask maccy
brew install --cask boop
brew install --cask arc
brew install --cask iterm2
brew install --cask spotify
brew install gh
brew install tmux
brew install yarn

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# iterm2
curl https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors > /tmp/Snazzy.itermcolors && open /tmp/Snazzy.itermcolors

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# nvim undo log
mkdir -p ~/.vim/undodir

# update zsh
cp .zshrc ~/.zshrc
