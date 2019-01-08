#!/bin/zsh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # install neovim
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install -y neovim
    sudo apt-get install -y python-dev python-pip python3-dev python3-pip
    # install zsh
    sudo apt-get install -y zsh
    sudo chsh -s $(which zsh) $(whoami)

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # install neovim
    brew install neovim
	# install vundle vim plugin manager
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    # install tmux
    brew install tmux
    # install zsh
    brew install zsh
    chsh -s $(which zsh)
    # install prezto
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    # https://github.com/sharkdp/fd
    brew install fd
    # https://github.com/junegunn/fzf
    brew install fzf
    brew install the_silver_searcher

elif [[ "$OSTYPE" == "freebsd"* ]]; then
fi

# install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# link bin executables
ln bin/* /usr/local/bin

# link tmux config
ln .tmux.conf ~/.tmux.conf

# link vim config
ln -f .vimrc ~/.vimrc
mkdir -p ~/.config/nvim
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after
     let &packpath = &runtimepath
     source ~/.vimrc
' > ~/.config/nvim/init.vim

# link zshrc config
ln -f .zshrc ~/.zshrc

ln -f .aliases ~/.aliases

ln -f .gitignore ~/.gitignore
ln -f .zshrc ~/.zshrc
