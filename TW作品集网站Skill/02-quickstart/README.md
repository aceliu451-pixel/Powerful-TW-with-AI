# 快速开始 Quickstart

5 分钟内完成作品集网站的搭建与本地预览。

---

## 前置条件

| 依赖 | 版本要求 | 检查命令 |
|------|----------|----------|
| Python | 3.8+ | `python3 --version` |
| pip | 任意 | `pip3 --version` |
| Git | 任意 | `git --version` |

> `mkdocs-material` 会由脚本自动安装，无需手动操作。

---

## 步骤一：获取脚本

```bash
git clone https://github.com/aceliu451-pixel/Powerful-TW-with-AI.git
cd Powerful-TW-with-AI
```

---

## 步骤二：运行脚本

```bash
chmod +x init-portfolio.sh
./init-portfolio.sh my-portfolio
```

`my-portfolio` 是目标目录名，可自定义。省略则在当前目录生成。

脚本输出示例：

```
📦 mkdocs-material not found. Installing...
✅ Installed.
✅ Portfolio scaffolded successfully.

Next steps:
  cd my-portfolio
  python3 -m mkdocs serve
```

---

## 步骤三：启动本地预览

```bash
cd my-portfolio
python3 -m mkdocs serve
```

打开浏览器访问 `http://127.0.0.1:8000`，即可看到完整的作品集网站。

---

## 步骤四（可选）：发布到 GitHub Pages

```bash
python3 -m mkdocs gh-deploy
```

发布后访问地址格式为：`https://<your-username>.github.io/<repo-name>/`

---

## 下一步

- 替换 `docs/` 下各页面的示例内容为你的真实作品
- 修改 `mkdocs.yml` 中的 `site_name` 和 `site_author`
- 参考 [用户手册](../03-user-guide/README.md) 了解详细定制方法
