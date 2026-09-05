#!/usr/bin/env bash
#
# 一键部署到 GitHub Pages
# 用法:
#   chmod +x deploy.sh
#   ./deploy.sh <你的GitHub用户名> <仓库名>
#
# 示例:
#   ./deploy.sh zhangsan portfolio
#
set -euo pipefail

# ---------- 参数 ----------
GH_USER="${1:?用法: ./deploy.sh <GitHub用户名> <仓库名>}"
REPO="${2:?用法: ./deploy.sh <GitHub用户名> <仓库名>}"

REMOTE="https://github.com/${GH_USER}/${REPO}.git"
SITE_URL="https://${GH_USER}.github.io/${REPO}/"

# ---------- git 基础配置(首次运行时取消注释并改成你的信息) ----------
# git config --global user.name  "你的姓名"
# git config --global user.email "你的邮箱"

# ---------- 初始化并提交(如果还没提交过) ----------
cd "$(dirname "$0")"

if [ ! -d .git ]; then
  git init
fi

git add -A
if git diff --cached --quiet; then
  echo "没有需要提交的改动。"
else
  git commit -m "deploy: personal portfolio site"
fi

# ---------- 关联远程仓库并推送 ----------
if git remote | grep -q "^origin$"; then
  git remote set-url origin "$REMOTE"
else
  git remote add origin "$REMOTE"
fi

# 使用 main 分支
git branch -M main
git push -u origin main

# ---------- 提示下一步 ----------
cat <<EOF

✅ 已推送到 main 分支。

接下来在浏览器里操作(只需做一次):
  1. 打开: https://github.com/${GH_USER}/${REPO}/settings/pages
  2. 「Source / Branch」选择 main,目录选 / (root),点 Save
  3. 等 1~2 分钟,访问:

     ${SITE_URL}

EOF
