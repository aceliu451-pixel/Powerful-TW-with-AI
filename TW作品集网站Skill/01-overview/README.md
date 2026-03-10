# 概述 Overview

## 这个 Skill 是什么

**TW 作品集网站 Skill** 是一个一键脚手架工具，帮助技术文档工程师（Technical Writer）在 5 分钟内搭建一个专业的在线作品集展示网站。

核心工具：`init-portfolio.sh` — 一个 Bash 脚本，自动生成完整的 MkDocs + Material 主题网站，包含 7 个标准 TW 作品集页面。

---

## 适用人群

| 用户类型 | 使用场景 |
|----------|----------|
| 求职中的 TW | 快速搭建作品集，展示给招聘方 |
| 在职 TW | 建立个人技术品牌，沉淀写作样例 |
| TW 转型者 | 用 Docs-as-Code 实践证明技术能力 |
| TW 培训讲师 | 作为教学演示工具 |

---

## 核心价值

- **零配置启动**：一条命令，自动安装依赖、生成文件结构、填充示例内容
- **专业内容模板**：7 个页面覆盖 TW 岗位 JD 中最常见的能力考察点
- **Docs-as-Code 实践**：网站本身即是 Markdown + Git 工作流的活体演示
- **可直接部署**：支持 `mkdocs gh-deploy` 一键发布到 GitHub Pages

---

## 生成的网站结构

运行 `init-portfolio.sh` 后，你将得到：

```
[target-dir]/
├── mkdocs.yml          # 网站配置（主题、导航、扩展）
├── README.md           # 项目说明
└── docs/
    ├── index.md            # 首页 — 个人介绍与技能概览
    ├── api-reference.md    # API 文档样例
    ├── user-guide.md       # 用户手册样例
    ├── release-notes.md    # 发布说明样例
    ├── troubleshooting.md  # 故障排查样例
    ├── style-guide.md      # 写作规范样例
    └── about.md            # 关于我
```

---

## 技术栈

| 组件 | 说明 |
|------|------|
| MkDocs | Python 静态文档网站生成器 |
| Material for MkDocs | 主题，提供响应式布局与丰富组件 |
| Markdown | 内容格式 |
| Git | 版本控制 |
| GitHub Pages | 免费静态网站托管 |

---

## 与其他方案的对比

| 方案 | 优点 | 缺点 |
|------|------|------|
| **本 Skill（MkDocs）** | 一键生成、Python 生态、Material 主题美观 | 需要 Python 环境 |
| Docusaurus | React 生态、功能强大 | 配置复杂，需要 Node.js |
| Notion / Confluence | 无需本地环境 | 不体现 Docs-as-Code 能力 |
| 手写 HTML | 完全自定义 | 维护成本高 |
