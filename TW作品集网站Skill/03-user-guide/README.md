# 用户手册 User Guide

本手册介绍如何定制 `init-portfolio.sh` 生成的作品集网站，将示例内容替换为你的真实作品。

---

## 修改网站基本信息

编辑 `mkdocs.yml` 顶部字段：

```yaml
site_name: 你的名字 — TW Portfolio
site_author: 你的名字
site_description: Technical Writer portfolio
```

---

## 定制各页面内容

### 首页（docs/index.md）

替换以下内容：
- 个人简介段落
- 技能列表（API documentation、Docs-as-Code 等）
- 导航表格中的描述文字

### API 文档样例（docs/api-reference.md）

建议替换为你实际参与过的 API 文档片段，或基于公开 API（如 GitHub API、Stripe API）重新撰写一个完整示例。关键要素：
- Base URL 与认证方式
- 至少 2 个端点（GET + POST）
- 请求参数表格
- 响应示例（JSON）
- 错误码表格

### 用户手册样例（docs/user-guide.md）

替换为任意产品的任务导向操作指南。结构建议：
1. 概述
2. 快速开始（3-5 步）
3. 常见任务（每个任务独立 H3）
4. 权限/角色说明表格

### 发布说明（docs/release-notes.md）

遵循 [Keep a Changelog](https://keepachangelog.com) 格式，记录 Added / Changed / Fixed / Deprecated。

### 故障排查（docs/troubleshooting.md）

结构建议：
- 错误码速查表（错误码 | HTTP 状态 | 原因 | 解决方案）
- 常见问题 FAQ（使用 `???` 折叠组件）

### 写作规范（docs/style-guide.md）

替换为你实际制定或遵循的写作规范，体现你对文档标准化的理解。

### 关于我（docs/about.md）

填写真实信息：
- 姓名、职位、专长
- 工作经历亮点（3-5 条）
- 联系方式（邮箱、GitHub、LinkedIn）

---

## 添加新页面

1. 在 `docs/` 下创建新的 `.md` 文件
2. 在 `mkdocs.yml` 的 `nav` 中添加对应条目：

```yaml
nav:
  - 🏠 Home: index.md
  - 📘 API Reference: api-reference.md
  - 📂 Case Studies:
    - Project A: case-studies/project-a.md
```

---

## 修改主题颜色

在 `mkdocs.yml` 的 `theme.palette` 中修改 `primary` 值：

```yaml
palette:
  - scheme: default
    primary: teal   # 可选：red, pink, purple, indigo, blue, teal, green 等
```

---

## 添加 favicon 和 logo

```yaml
theme:
  name: material
  logo: assets/logo.png
  favicon: assets/favicon.ico
```

将图片放入 `docs/assets/` 目录即可。
