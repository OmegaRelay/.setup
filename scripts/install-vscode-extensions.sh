#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
	ms-vscode.cpptools
	vscodevim.vim
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done
