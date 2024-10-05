#!/bin/bash

echo "==========开始桌面美化配置=========="
sudo pacman -Syyu
sudo pacman -S yay
yay -S gnome-tweaks gnome-software aur/extension-manager
yay -S aur/whitesur-gtk-theme aur/whitesur-icon-theme aur/whitesur-cursor-theme

echo "==========开始下载并配置gtk主题=========="
# 先创建一个主题存放目录，然后下载 WhiteSur 系统主题
cd $HOME/下载

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
# 修改 Firefox 主题
# 可以通过编辑
./tweaks.sh -f

# 修改锁屏登陆页主题
sudo ./tweaks.sh -g
# 查看所有命令的作用
# ./install.sh -h
