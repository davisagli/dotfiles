#!/bin/bash

# Careful! This only works for David without changes, and might bork things.

# Prerequisites:
# - Install XCode
# - Generate keypair and upload public key to github (see docs there)

# Install homebrew
ruby -e "$(curl -fsSLk https://gist.github.com/raw/323731/install_homebrew.rb)"

# Install joe
brew install joe

# Install git
brew install git
git clone git@github.com:davisagli/homebrew.git /tmp/homebrew
mv /tmp/homebrew/.git /usr/local
rm -rf /tmp/homebrew

# Set up dot files
git clone git@github.com:davisagli/dotfiles.git /tmp/dotfiles
mv /tmp/dotfiles/.git ~/
rm -rf /tmp/dotfiles
cd ~
git reset --hard

# Install pythons
# (System python remains as "python" alias, use python2.6 for the custom one)
# TODO: fix buildout.cfg to use /usr/local instead of /opt/local as the prefix
cd /usr/local
mkdir src
cd src
svn co http://svn.plone.org/svn/collective/buildout/python
cd python
easy_install -U setuptools
python bootstrap.py
bin/buildout -Nv
yes | bin/install-links
sudo rm /usr/bin/python2.6 /usr/bin/easy_install-2.6
