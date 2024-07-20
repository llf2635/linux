#!/bin/bash

sudo pacman -Syyu
sudo pacman -S yay git
git config --global user.name "龙茶清欢"
git config --global user.email "2320391937@qq.com"
ssh-keygen -t rsa -b 4096 -C "2320391937@qq.com"
cat ~/.ssh/id_rsa.pub

# 参考：https://www.cnblogs.com/fatalord/p/13850072.html
sudo pacman -Rns fcitx ibus
sudo pacman -Rs $(pacman -Qsq fcitx)
# 参考官方文档： https://wiki.archlinuxcn.org/wzh/index.php?title=Fcitx5#%E4%B8%AD%E6%96%87
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-qt fcitx5-gtk fcitx5-chinese-addons fcitx5-material-color fcitx5-input-support


echo "==========开始安装gnome相关软件=========="
# 下载系统基础工具，安装GNOME插件和扩展, gnome-shell-extensions
# yay 包管理器不要使用  sudo
yay -S gnome-tweaks gnome-software chrome-gnome-shell flatpak gnome-software-plugin-flatpak
# 系统扩展目录
# nautilus admin:/usr/share/gnome-shell/extensions

# 网站国内可用 DNS 测试 ping 	https://ping.chinaz.com/www.youtube.com
# 配置Github访问加速
echo "
# GitHub Start
20.205.243.166     github.com
185.199.109.133    raw.githubusercontent.com
# GitHub End
" | sudo tee -a /etc/hosts

cat /etc/hosts




