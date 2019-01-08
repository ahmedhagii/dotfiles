#!/bin/zsh

# CentOS
if [ -f /etc/redhat-release ]; then
	sudo yum install -y the_silver_searcher zsh neovim fd tmux
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --completion --update-rc --no-key-bindings

# Ubuntu
elif [ -f /etc/lsb-release ]; then

	# install neovim
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	sudo apt-get install -y neovim
	sudo apt-get install -y python-dev python-pip python3-dev python3-pip
	# install zsh
	sudo apt-get install -y zsh
	sudo chsh -s $(which zsh) $(whoami)

# MacOS
elif [[ "$OSTYPE" == "darwin"* ]]; then

	which -s brew
	if [[ $? != 0 ]] ; then
		# Install Homebrew
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		brew update
	fi
	# install neovim
	brew install neovim
	# install vundle vim plugin manager
	if [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
		echo "Vundle already installed"
	else
		echo "Installing Vundle.."
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi
	# install tmux
	brew install tmux
	# install zsh
	brew install zsh
	chsh -s $(which zsh)
	# install prezto
	if [ -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
		echo "prezto already installed"
	else
		echo "Installing prezto.."
		git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
	fi
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

# copy .tmux.conf from my github
curl -LSso ~/.tmux.conf https://raw.github.com/ahmedhagii/dotfiles/master/.tmux.conf

# copy .vimrc and link to neovim
curl -LSso ~/.tmux.conf https://raw.github.com/ahmedhagii/dotfiles/master/.tmux.conf
mkdir -p ~/.config/nvim
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
	source ~/.vimrc
' > ~/.config/nvim/init.vim

# link aliases
curl -LSso ~/.aliases https://raw.github.com/ahmedhagii/dotfiles/master/.aliases

# link prezto config
curl -LSso ~/.zpreztorc https://raw.github.com/ahmedhagii/dotfiles/master/.zpreztorc

# link global gitignore
curl -LSso ~/.gitignore https://raw.github.com/ahmedhagii/dotfiles/master/.gitignore

# link zsh config
curl -LSso ~/.zshrc https://raw.github.com/ahmedhagii/dotfiles/master/.zshrc
