#!/bin/bash

# gnome-extensions 直接使用可以查看扩展的所有命令的作用
# help      打印帮助
# version   打印版本
# enable    启用扩展
# disable   禁用扩展
# reset     重置扩展
# uninstall 卸载扩展
# list      列出扩展
# info      显示扩展信息
# show      显示扩展信息
# prefs     打开扩展首选项
# create    创建扩展
# pack      打包扩展
# install   安装扩展包
# gnome-extensions help
# gnome-extensions list	列出可安装的扩展插件
# gnome-extensions install rounded-window-corners@yilozt.shell-extension.zip
# gnome-extensions uninstall forge@jmmaranan.com
# 将 扩展、优化、扩展管理器这三个打开快捷指令添加到 SettingsCenter@lauinger-clan.de 扩展配置中，以此来减少dock栏的应用


# 以下是必装和推荐安装的扩展插件
SettingsCenter@lauinger-clan.de
blur-my-shell@aunetx
caffeine@patapon.info
clipboard-indicator@tudmotu.com
hidetopbar@mathieu.bidon.ca
just-perfection-desktop@just-perfection
bluetooth-quick-connect@bjarosze.gmail.com
compiz-alike-magic-lamp-effect@hermes83.github.com
compiz-windows-effect@hermes83.github.com
wifiqrcode@glerro.pm.me
kimpanel@kde.org
quick-settings-avatar@d-go
ProxySwitcher@flannaghan.com
PrivacyMenu@stuarthayhurst
user-theme@gnome-shell-extensions.gcampax.github.com
arcmenu@arcmenu.com
custom-accent-colors@demiskp
dash-to-dock@micxgx.gmail.com
gsconnect@andyholmes.github.io
gtk4-ding@smedius.gitlab.com
pamac-updates@manjaro.org
space-bar@luchrioh
apps-menu@gnome-shell-extensions.gcampax.github.com
auto-move-windows@gnome-shell-extensions.gcampax.github.com
drive-menu@gnome-shell-extensions.gcampax.github.com
places-menu@gnome-shell-extensions.gcampax.github.com
nightthemeswitcher@romainvigier.fr
appindicatorsupport@rgcjonas.gmail.com
windowgestures@extension.amarullz.com
rounded-window-corners@yilozt

# trayIconsReloaded@selfmade.pl
# ddterm@amezin.github.com
# gtk4-ding@smedius.gitlab.com
# status-area-horizontal-spacing@mathematical.coffee.gmail.com
# Vitals@CoreCoding.coms
# vbox-applet@gs.eros2.info
# lan-ip-address@mrhuber.com
# workspace-indicator@gnome-shell-extensions.gcampax.github.com


# 自动自带的系统扩展移除办法
nautilus admin:/usr/share/gnome-shell/extensions
# 用户扩展目录
nautilus ~/.local/share/gnome-shell/extensions

cd ~/.local/share/gnome-shell/extensions
# 修改对应插件的配置内容，此处以修改 SettingsCenter 插件的 Menu Label 为名称为设置中心
cat SettingsCenter@lauinger-clan.de/schemas/org.gnome.shell.extensions.SettingsCenter.gschema.xml
gsettings list-keys org.gnome.shell.extensions.SettingsCenter

# .po文件编辑器
yay -S extra/poedit
# 将.mo文件转换为可编辑的.po文件。然后，您可以使用任何文本编辑器打开并修改.po文件。po文件为汉化模板文件
msgunfmt hidetopbar.mo -o hidetopbar.po
msgunfmt SettingsCenter.mo -o SettingsCenter.po
msgunfmt PrivacyMenu@stuarthayhurst.mo -o PrivacyMenu@stuarthayhurst.po

# 只需要将汉化文件添加到对应插件的 locale 国际化目录下即可。具体步骤如下：
1、首先随便在插件中选择一门国际化目录，然后将国际化文件转成可编辑的po模板文件，再使用上面安装的 poedit 打开，
2、然后点击 toolbar 中的 翻译/属性将其中的语言改成	中文（简体）
3、然后对汉化模板 po 文件的每一项进行翻译，保存
4、然后将 zh_CN 目录复制到对应插件的 locale 国际化目录
