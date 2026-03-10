# 故障排查 Troubleshooting

---

## 错误速查表

| 错误信息 | 原因 | 解决方案 |
|----------|------|----------|
| `ModuleNotFoundError: No module named 'mkdocs_material'` | mkdocs-material 安装失败 | 手动运行 `pip3 install mkdocs-material` |
| `command not found: python3` | Python 未安装或不在 PATH | 安装 Python 3.8+，或使用 `python` 替代 `python3` |
| `Permission denied: ./init-portfolio.sh` | 脚本无执行权限 | 运行 `chmod +x init-portfolio.sh` |
| `Config file 'mkdocs.yml' does not exist` | 在错误目录运行了 `mkdocs serve` | `cd` 进入包含 `mkdocs.yml` 的目录再运行 |
| `WARNING - Doc file not found` | `nav` 中引用的文件不存在 | 检查 `mkdocs.yml` 中的文件路径是否与 `docs/` 下的实际文件名一致 |
| `Address already in use: 8000` | 端口被占用 | 使用 `python3 -m mkdocs serve --dev-addr=127.0.0.1:8001` 换端口 |
| `gh-deploy` 失败：`remote: Permission to ... denied` | GitHub 认证问题 | 确认已配置 SSH key 或 HTTPS token，运行 `git remote -v` 检查远端地址 |

---

## 常见问题

### 脚本运行后网站样式异常（纯文本，无主题）

**原因**：`mkdocs serve` 未运行，直接打开了 `docs/index.md` 文件。

**解决**：必须通过 `python3 -m mkdocs serve` 启动本地服务器，再访问 `http://127.0.0.1:8000`。

---

### 修改了 `docs/` 下的文件，但浏览器没有更新

`mkdocs serve` 支持热重载，保存文件后浏览器会自动刷新。若未刷新：
1. 确认 `mkdocs serve` 进程仍在运行（终端未关闭）
2. 强制刷新浏览器：`Cmd+Shift+R`（macOS）或 `Ctrl+Shift+R`（Windows/Linux）

---

### `mkdocs.yml` 中的 `nav` 路径报错

MkDocs 的文件路径相对于 `docs/` 目录，不是项目根目录：

```yaml
# 正确：文件位于 docs/api-reference.md
nav:
  - API Reference: api-reference.md

# 错误
nav:
  - API Reference: docs/api-reference.md
```

---

### pip3 安装 mkdocs-material 时网络超时

使用国内镜像源：

```bash
pip3 install mkdocs-material -i https://pypi.tuna.tsinghua.edu.cn/simple
```

---

### GitHub Pages 部署后页面空白或 404

1. 确认仓库 Settings > Pages 中 Source 设置为 `gh-pages` 分支
2. 等待 1-2 分钟让 GitHub Actions 完成部署
3. 检查 `mkdocs.yml` 中是否设置了正确的 `site_url`：

```yaml
site_url: https://<your-username>.github.io/<repo-name>/
```
