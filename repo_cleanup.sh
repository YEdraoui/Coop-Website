#!/usr/bin/env bash
set -euo pipefail

ROOT="$HOME/Desktop/E+E Website/wil-aui-platform"
cd "$ROOT"

echo "🧹 Cleaning repository…"

# 0) Ensure .gitignore
cat > .gitignore << 'EOF'
# Node / Next / TS
node_modules/
.npm/
.next/
dist/
out/
coverage/
.eslintcache
*.log

# Env & local
.env
.env.*.local

# OS / Editor
.DS_Store
*.swp
.vscode/
.idea/

# App-specific
frontend/.next/
frontend/out/
backend/dist/
EOF

# 1) Create canonical branding structure
mkdir -p frontend/public/branding/aui \
         frontend/public/branding/office \
         frontend/public/branding/programs

# Move any loose brand assets into the right place (best-effort)
if [ -d "public_assets" ]; then
  # Try to place via filename hints
  find public_assets -type f -iname "*aui*" -exec cp -n {} frontend/public/branding/aui/ \; || true
  find public_assets -type f -iname "*office*" -o -iname "*wil-office*" -exec cp -n {} frontend/public/branding/office/ \; || true
  find public_assets -type f -iname "*coop*" -o -iname "*co-op*" -exec cp -n {} frontend/public/branding/programs/ \; || true
  find public_assets -type f -iname "*remote*" -exec cp -n {} frontend/public/branding/programs/ \; || true
  find public_assets -type f -iname "*alternance*" -exec cp -n {} frontend/public/branding/programs/ \; || true
fi

# Handle the PDF logos folder if present
if [ -d "AUI Co-Op Logo" ]; then
  cp -n "AUI Co-Op Logo"/* frontend/public/branding/programs/ 2>/dev/null || true
fi

# 2) Keep only these top-level scripts
mkdir -p scripts
KEEP=(deploy.sh quick-launch.sh phase6_launch_deployment.sh)
for f in "${KEEP[@]}"; do
  if [ -f "$f" ]; then
    mv -f "$f" scripts/
  fi
done

# 3) Remove/relocate development phase scripts (now noise)
#    We’ll keep docs/*.md, but delete the numerous phase*.sh helpers at root.
find . -maxdepth 1 -type f -name "phase*.sh" -not -name "phase6_launch_deployment.sh" -delete || true
find . -maxdepth 1 -type f -name "*fix*.sh" -delete || true
find . -maxdepth 1 -type f -name "final_*" -delete || true
find . -maxdepth 1 -type f -name "execute-phase5.sh" -delete || true
find . -maxdepth 1 -type f -name "css_fix_immediate.sh" -delete || true

# 4) Remove root node_modules (frontend/backend node_modules remain)
if [ -d "node_modules" ]; then
  rm -rf node_modules
fi

# 5) Optional: remove stray caches
rm -rf .next 2>/dev/null || true

echo "✅ Repo cleaned. Staging changes…"
git add -A

echo "✍️  Commit message:"
MSG="chore: cleanup repo (green/yellow brand, assets to frontend/public/branding, move scripts/, remove dev phase scripts)"
git commit -m "$MSG" || echo "Nothing to commit."

# 6) Push (assumes 'origin' is configured and branch is main)
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo main)
git push -u origin "$BRANCH"

echo "🚀 Pushed to $BRANCH. Done."

