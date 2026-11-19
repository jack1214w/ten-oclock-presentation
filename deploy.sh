#!/bin/bash
# ============================================================
# 十點的發表會 — 一鍵更新部署腳本
# 用法：在終端機輸入
#   bash ~/Desktop/CC工作區/Code專屬/資優情意遊戲-十點的發表會/site/deploy.sh
# 它會自動：
#   1. 把上一層資料夾最新的遊戲檔與討論區複製進來
#   2. 提交（commit）並推送（push）到 GitHub
#   3. GitHub Pages 約 1 分鐘後自動更新
# 注意：劇本.md（含通關解答）不會被上傳。
# ============================================================
set -e
cd "$(dirname "$0")"

mkdir -p game discussion chapter2
cp "../十點的發表會.html" game/index.html
cp "../失敗討論區.html"   discussion/index.html
cp "../三點的紙橋.html"   chapter2/index.html
echo "✔ 已複製最新的遊戲與討論區"

if [ -z "$(git status --porcelain)" ]; then
  echo "沒有變更，線上版已是最新，不需要部署。"
  exit 0
fi

git add -A
git commit -m "更新 $(date '+%Y-%m-%d %H:%M')"
git push -u origin main

echo ""
echo "✅ 推送完成！約 1 分鐘後自動更新："
echo "   遊戲：  https://jack1214w.github.io/ten-oclock-presentation/game/"
echo "   討論區：https://jack1214w.github.io/ten-oclock-presentation/discussion/"
echo "   第二章：https://jack1214w.github.io/ten-oclock-presentation/chapter2/"
