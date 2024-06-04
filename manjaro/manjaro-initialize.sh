#!/bin/bash

sudo pacman -Syyu
sudo pacman -S yay git
sudo pacman -R fcitx ibus
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-chinese-addons

echo "==========开始安装gnome相关软件=========="
# 下载系统基础工具，安装GNOME插件和扩展, gnome-shell-extensions
# yay 包管理器不要使用  sudo
yay -S gnome-tweaks gnome-software chrome-gnome-shell flatpak gnome-software-plugin-flatpak


