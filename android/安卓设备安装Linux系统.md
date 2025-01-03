安卓手机并不能直接“原生”安装Linux系统，至少不是以通常意义上的方式。这是因为Android操作系统虽然是基于Linux内核构建的，但它包含了大量的专有驱动程序和服务，这些都是针对移动设备优化的，并且与底层硬件紧密集成。直接安装一个标准的Linux发行版通常需要对设备进行大量的定制和重新编译工作，以便支持设备特有的硬件组件，如触摸屏、摄像头、网络接口等。

然而，有一些社区项目和开发者尝试使Linux桌面环境能够在移动设备上运行，但这通常意味着使用诸如模拟层或容器技术（例如Proot或UserLAnd）来实现在Android之上运行Linux系统。这种方式并不是真正意义上的“原生”安装，因为它依赖于Android操作系统提供底层支持，并且Linux环境运行在容器或虚拟环境中。

也有个别情况下的实验性移植，如Ubuntu Touch这类项目试图提供一种既可以运行Linux环境也能兼容Android应用的操作系统，但这并不是主流Linux发行版的直接安装，而是一种专门为移动设备设计的替代操作系统。

总之，如果你想在安卓手机上体验Linux环境，最实际的方式可能是通过已有的工具或应用，如Linux Deploy、UserLAnd等，在Android之上建立一个Linux的运行环境。这些方法允许你在不破坏Android系统的情况下，体验Linux命令行或甚至图形界面。不过，这依然不是在设备上直接安装Linux系统，而是通过兼容层或虚拟化技术实现的。



`proot` 是一个用户空间的工具，它可以模拟 Linux 的 chroot 环境，而不需要真正的 root 权限。`proot` 是 "pseudo-root" 的缩写，它允许你在没有超级用户权限的情况下创建一个隔离的文件系统环境。这意味着你可以为一个进程创建一个新的根目录，这个根目录实际上只是当前文件系统的另一个路径，但是从该进程的角度来看，它会被当作系统的根目录 `/`。

对于 Android 用户来说，`proot` 提供了一个便利的方法来运行 Linux 发行版或者单个的 Linux 应用程序，而无需对设备进行解锁或者 root 操作，这样可以保持设备的安全性和保修状态。一些基于 `prorow` 的 Android 应用，如 Linux Deploy，就是利用这种技术来创建一个 Linux 运行环境的。

`proot` 本身是一个非常轻量级的工具，它通常用于开发环境、测试场景以及其他需要隔离文件系统的情况。在 Android 设备上，它可以用来创建一个小型的 Linux 环境，允许用户安装并运行 Linux 命令行工具甚至是图形界面应用程序。

需要注意的是，尽管 `proot` 不需要 root 权限，但是它的功能还是受限于 Android 操作系统的权限管理。因此，并非所有的 Linux 功能都能完全地在 `proot` 环境中复现，尤其是那些需要超级用户权限的功能。

如果你想要在 Android 设备上运行一个完整的 Linux 环境，并且希望这个环境拥有完整的权限来访问所有硬件资源，那么你也可能需要 root 权限。例如，使用带有完整 Linux 内核和用户空间的应用程序，如Termux结合BusyBox，或者更复杂的如Ubuntu Touch这样的操作系统，可能就需要 root 权限来确保Linux环境可以完全控制硬件资源。



要在Android手机上使用`proot`，你需要下载并安装一个支持`proot`的应用程序。其中最流行的几个应用程序包括`Termux`和`Linux Deploy`。这里我会简要说明如何使用这两个应用程序来运行Linux环境。

### 使用 Termux

1. **下载并安装Termux**：
   在Google Play商店中搜索“Termux”，然后下载并安装这个应用。

2. **安装必要的包**：
   Termux 自带了一个简单的包管理系统，你可以使用它来安装Linux软件包。打开Termux应用后，你可以输入以下命令来安装一些基础的Linux工具：
   
   ```bash
   pkg install <package_name>
   apt update && apt upgrade -y
   切换软件仓库
   termux-change-repo
   apt install openssh neofetch
   sshd
   passwd
   whoami
   ifconfig
   ssh -p 8022 u0_a267@192.168.124.9
   
   apt install proot-distro -y
   proot-distro install ubuntu
   proot-distro remove ubuntu
   proot-distro login ubuntu
   # 配置dpkg
   dpkg --configure -a
   
   apt install apt-transport-https ca-certificates -y
   cat /etc/apt/sources.list
   echo "" | tee /etc/apt/sources.list
   
   # 替换ubuntu官方的软件仓库，改用阿里云加速镜像仓库
   echo "
   Types: deb
   URIs: http://mirrors.aliyun.com/ubuntu/
   Suites: noble noble-updates noble-backports
   Components: main restricted universe multiverse
   Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
   
   Types: deb
   URIs: http://security.ubuntu.com/ubuntu/
   Suites: noble-security
   Components: main restricted universe multiverse
   Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
   " | tee /etc/apt/sources.list.d/ubuntu.sources
   
   cat /etc/apt/sources.list.d/ubuntu.sources
   
   apt update && apt upgrade -y
   
   
   
   git clone https://gitee.com/pdusb/pdusb-fast-btpanel.git
   cd pdusb-fast-btpanel
   ./pdbolt-inst-bt-acel.sh
   bash /tmp/btp/pdbolt-bt-install/install.sh
   
   /etc/init.d/bt restart
   # 进入宝塔工具面板，可查看修改端口和密码
   bt
   
   
   
   # Linux面板安装脚本
   if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
   
   btpip install psutil gevent
   
   chown -R 777 /www
   bt 4
   
   
   proot-distro install archlinux
   proot-distro login archlinux
   curl -sSO http://download.bt.cn/install/install_panel.sh && bash install_panel.sh 28615082
   
   
   https://blog.csdn.net/zzj19941115/article/details/121060935
   ```
   例如，安装`vim`编辑器：
   ```bash
   pkg install vim
   ```
   
3. **安装Linux发行版**：
   Termux默认并不提供完整的Linux发行版，但你可以安装一些基本的工具来接近一个Linux环境。如果你想要一个更完整的Linux环境，可能需要探索其他解决方案，如Linux Deploy。

### 使用 Linux Deploy

1. **下载并安装Linux Deploy**：
   在Google Play商店中搜索“Linux Deploy”，然后下载并安装这个应用。

2. **选择Linux发行版**：
   安装完成后，打开Linux Deploy应用，选择你想要安装的Linux发行版（如Debian、Arch Linux等）。

3. **开始安装**：
   根据应用提示完成Linux发行版的安装过程。安装过程中，Linux Deploy将使用`proot`来创建一个虚拟的Linux环境。

4. **启动Linux环境**：
   安装完成后，你可以通过Linux Deploy应用启动你的Linux环境。你会看到一个终端窗口，可以在其中执行Linux命令。

### 注意事项

- `proot`虽然不需要root权限，但在某些情况下，特别是当你需要访问某些硬件特性或者更深入地控制Linux环境时，root权限可能会更加方便。
- 使用`proot`创建的Linux环境是有限制的，并不能像在PC上那样拥有完整的性能和功能。
- 需要考虑设备性能，因为并非所有设备都能流畅运行Linux环境。

使用这些工具可以在Android设备上创建一个Linux运行环境，这对于喜欢折腾和学习Linux的用户来说是一个不错的选择。不过，由于`proot`的限制以及Android设备本身的性能差异，这可能不是一个理想的长期解决方案。如果你经常需要使用Linux环境，考虑使用一台具有更高性能的计算机或服务器。





使用 chroot 容器

```
ssh -p 8022 u0_a267@192.168.124.9
# 安卓手机在Termux基于chroot运行Ubuntu的rootfs
pkg update && pkg upgrade -y
pkg install tsu pulseaudio
su
```

