#!/bin/bash

if [ "$SHELL" = "/bin/zsh" ] || [ "$0" = "zsh" ]; then
	echo "Zsh is not installed, so I will install it."
	sudo apt install -y zsh
	chsh -s $(which zsh)
	echo "Plz relogin"
else
	echo "Zsh is installed, so I will install Django and copy the config files for nvim."
	cp ./zshrc/.zshrc ~ 
	pip install Django
	curl -o- -L https://yarnpkg.com/install.sh | zsh
	git clone https://github.com/nodenv/nodenv.git ~/.nodenv
	~/.nodenv/bin/nodenv init
	git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	./nvim.appimage --appimage-extract
	./squashfs-root/AppRun --version
	mkdir -p ~/.config/nvim
	cp ./vimrc/init.vim ~/.config/nvim/
	sudo apt update
	#install

	sudo mv squashfs-root /
	sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
	sudo apt install -y exa
	sudo apt install -y fd-find
	sudo snap install -y procs
	sudo apt install -y ripgrep
	sudo apt install -y hexyl
	sudo apt upgrade
fi


exec $SHELL

