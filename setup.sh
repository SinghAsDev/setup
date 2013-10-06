#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

#Install vim
sudp apt-get install -y vim

#Install nodejs and npm
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
git clone https://github.com/SinghAsDev/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.tmux.conf .

sudo cp -r dotfiles/.vim/* ~/.vim/

#General vim plugins
cd ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git #For browsing filesystem inside vim
git clone git://github.com/godlygeek/tabular.git #For indenting files with regex
git clone https://github.com/scrooloose/syntastic.git #Syntax checker
git clone https://github.com/scrooloose/nerdcommenter.git # Comment or Uncomment code
git clone https://github.com/Lokaltog/vim-easymotion.git #Easy and fast navigation in vim

#Javascript specific vim plugins
git clone https://github.com/pangloss/vim-javascript.git  #Indentation for javascript
git clone https://github.com/jamescarr/snipmate-nodejs.git #Add nodejs snippets
mv snipmate-nodejs/snippets/javascript ~/.vim/snippets
rm -rf snipmate-nodejs

#HTML and CSS specific vim plugins
git clone http://github.com/mattn/zencoding-vim.git #Expanding abbreviations
