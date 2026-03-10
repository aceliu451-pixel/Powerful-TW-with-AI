# 发布说明 Release Notes

遵循 [Keep a Changelog](https://keepachangelog.com) 格式。

---

## [1.1.0] — 2025-03

### Added
- `TW作品集网站Skill/` 文件夹：以 TW 产品文档架构完整记录本 Skill，包含概述、快速开始、用户手册、脚本参考、最佳实践、故障排查、写作规范、术语表
- `navigation.tabs`、`navigation.sections`、`toc.integrate` 特性加入生成的 `mkdocs.yml`

### Changed
- `init-portfolio.sh` 导航结构优化：移除个人案例研究，聚焦通用 TW 能力展示（API Reference、User Guide、Release Notes、Troubleshooting、Style Guide）
- README.md 更新 clone URL 为 `github.com/aceliu451-pixel/Powerful-TW-with-AI`

---

## [1.0.0] — 2025-02

### Added
- `init-portfolio.sh`：一键脚手架脚本，自动安装 `mkdocs-material`，生成 7 页 TW 作品集网站
- 生成页面：Home、API Reference、User Guide、Release Notes、Troubleshooting、Style Guide、About
- 支持可选 `[target-dir]` 参数，默认在当前目录生成
- 自动生成 `README.md`，包含快速开始命令
- `set -euo pipefail` 保证脚本失败时立即退出
