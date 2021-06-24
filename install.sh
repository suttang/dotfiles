#!/bin/bash

# .zshrc
if [ -e ~/.zshrc ]; then
    rm ~/.zshrc
fi
ln -s $(pwd)/.zshrc ~/.zshrc

# .zprofile
if [ -e ~/.zprofile ]; then
    rm ~/.zprofile
fi
ln -s $(pwd)/.zprofile ~/.zprofile

# .hyper.js
if [ -e ~/.hyper.js ]; then
    rm ~/.hyper.js
fi
ln -s $(pwd)/.hyper.js ~/.hyper.js
