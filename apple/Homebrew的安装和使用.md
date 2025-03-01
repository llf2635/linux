以下是 **Homebrew 在 macOS 上的安装步骤**（支持 Intel 和 Apple Silicon 芯片）：

---

### **一键安装 Homebrew**
复制以下命令到终端执行（官方推荐脚本）：
```bash
# 官方网址 https://brew.sh/zh-cn/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### **Apple Silicon（M1/M2/M3/M4 芯片）注意事项**：
- 安装完成后，根据终端提示将 Homebrew 路径添加到环境变量：
  ```bash
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
  source ~/.zshrc
  ```
  （如果你使用 `bash`，替换 `.zshrc` 为 `.bash_profile`）

---

### **3. 验证安装**
```bash
brew --version
```
如果显示版本号（如 `Homebrew 4.2.0`），则安装成功。

---

### **4. 配置国内镜像（可选）**
如果下载速度慢，可替换为国内镜像源（如中科大或清华源）。  
**示例（清华源）**：

```bash
# 参考网站
https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/

# 配置 Homebrew 核心镜像
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
brew update

# 查看 Homebrew 仓库地址
git -C "$(brew --repo)" remote -v
```

---

### **5. 常见问题解决**
- **权限问题**：如果提示 `Permission denied`，尝试修复目录权限：
  ```bash
  sudo chown -R $(whoami) /opt/homebrew  # Apple Silicon
  ```
- **安装失败**：检查网络或重试，确保能访问 GitHub。

---

### **6. 安装后建议**
```bash
brew update    # 更新 Homebrew 自身
brew doctor    # 检查系统环境是否正常
```

---

### **卸载 Homebrew**
如需卸载，执行：
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```

---

完成后，你就可以通过 `brew install` 自由安装开发工具了！ 🎉