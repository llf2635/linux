参考博文 https://blog.csdn.net/Mingyueyixi/article/details/136010239

https://blog.csdn.net/zzj19941115/article/details/121060935

要让电脑通过SSH连接到安卓手机上的Termux，你需要先在Termux中安装OpenSSH服务器，并配置相关设置。下面是详细的步骤：

### 准备工作

1. **确保你的安卓设备已经root**：某些步骤需要root权限才能完成，特别是当涉及到网络设置时。
2. **安装Termux**：在Google Play商店中下载并安装Termux应用。

### 安装OpenSSH服务器

1. **打开Termux应用**。
2. **安装OpenSSH**：在Termux中输入以下命令来安装OpenSSH服务器：
   ```bash
   apt update && apt upgrade
   切换软件仓库
   termux-change-repo
   
   apt install openssh
   ```
   如果提示找不到`apt`命令，可以使用`pkg`代替：
   ```bash
   pkg update && pkg upgrade
   切换软件仓库
   termux-change-repo
   
   pkg install openssh
   ```

### 配置OpenSSH服务器

1. **初始化SSH服务**：
   ```bash
   sshd
   ```

2. **设置SSH密码**（可选）：
   ```bash
   passwd your_username
   passwd 479368
   whoami
   ssh -p 8022 u0_a267@192.168.124.9
   ```
   输入两次密码来设置SSH登录密码。如果你不想使用密码认证，可以跳过此步骤。
   
3. **生成SSH密钥**（推荐）：
   ```bash
   ssh-keygen
   ```
   接受默认选项来生成密钥对。

4. **启动SSH服务**：
   ```bash
   start sshd
   ```

### 获取IP地址

在电脑连接到手机的网络后，获取手机的局域网IP地址：

1. **查看IP地址**：在Termux中输入：
   ```bash
   ifconfig
   ```
   找到对应接口的IP地址（如`wlan0`或`usb0`）。

### 从电脑发起SSH连接

最后，在你的电脑上使用SSH客户端（如OpenSSH客户端）连接到手机：

```bash
ssh your_username@your_phone_ip_address
ssh your_username@192.168.124.9
ssh root@192.168.124.9
```

如果之前生成了SSH密钥对，你可以通过密钥认证；否则，输入之前设置的密码即可。

### 注意事项

- 确保你的安卓设备和电脑在同一局域网内。
- 如果你遇到连接问题，检查是否正确启用了网络共享，并确认没有防火墙阻止SSH连接。
- 对于非root设备，你可能需要寻找特定的应用程序或解决方案来绕过root限制。

以上步骤应该能帮助你在电脑上通过SSH连接到安卓设备的Termux环境。