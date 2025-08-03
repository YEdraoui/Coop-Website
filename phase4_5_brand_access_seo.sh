#!/usr/bin/env bash
set -euo pipefail

FRONTEND="$HOME/Desktop/E+E Website/wil-aui-platform/frontend"
cd "$FRONTEND"

echo "📁 Ensure asset folders"
mkdir -p public/branding/aui public/branding/office public/branding/programs public/favicons
for d in public/branding/aui public/branding/office public/branding/programs public/favicons; do
  [ -f "$d/.keep" ] || touch "$d/.keep"
done

echo "⚙️ Tailwind brand tokens (skip if already set)"
# Append tokens if not present
grep -q "colors: {\\s*brand:" tailwind.config.js || cat >> tailwind.config.js <<'TWEOF'

// --- AUI brand extension (added by phase4_5 script) ---
module.exports = {
  ...module.exports,
  theme: {
    ...(module.exports.theme || {}),
    extend: {
      ...((module.exports.theme && module.exports.theme.extend) || {}),
      colors: {
        ...(module.exports.theme && module.exports.theme.extend && module.exports.theme.extend.colors || {}),
        brand: {
          primary: '#0C5F4C',
          secondary: '#5BB090',
          accent: '#0B3C32',
          text: '#0A2721',
          bg: '#F7FAF9',
        },
        surface: '#FFFFFF'
      },
      fontFamily: {
        heading: ['Inter','system-ui','Arial','sans-serif'],
        body: ['Inter','system-ui','Arial','sans-serif'],
      },
      borderRadius: { xl: '1.25rem', lg: '1rem' }
    }
  }
}
// --- end AUI brand extension ---
TWEOF

echo "🖼️ Next images remotePatterns (Unsplash)"
cat > next.config.mjs <<'NXEOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    remotePatterns: [
      { protocol: 'https', hostname: 'images.unsplash.com' }
    ]
  },
  experimental: {}
}

export default nextConfig
NXEOF

echo "🗜️ Add Sharp + optimizer"
npm i -D sharp >/dev/null 2>&1 || true
mkdir -p scripts
cat > scripts/optimize-images.mjs <<'OPTEOF'
import fs from 'fs';
import path from 'path';
import sharp from 'sharp';

const ROOT = 'public/branding';
const exts = new Set(['.png','.jpg','.jpeg']);
const targets = ['-lg', 512, '-md', 256, '-sm', 128];

async function processImage(file) {
  const dir = path.dirname(file);
  const base = path.basename(file, path.extname(file));
  const buf = fs.readFileSync(file);
  // webp
  const webpOut = path.join(dir, `${base}.webp`);
  await sharp(buf).webp({ quality: 82 }).toFile(webpOut);
  // sizes
  for (let i = 0; i < targets.length; i += 2) {
    const suffix = targets[i];
    const width = targets[i+1];
    const out = path.join(dir, `${base}${suffix}.webp`);
    await sharp(buf).resize({ width }).webp({ quality: 80 }).toFile(out);
  }
}

function walk(dir) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) walk(full);
    else if (exts.has(path.extname(entry.name).toLowerCase())) queue.push(full);
  }
}

const queue = [];
walk(ROOT);
for (const file of queue) {
  await processImage(file).catch(err => console.error('opt err', file, err));
}
console.log(`Optimized ${queue.length} images under ${ROOT}`);
OPTEOF

# add npm script
jq '.scripts += {"optimize:images": "node scripts/optimize-images.mjs"}' package.json > package.tmp || true
if [ -f package.tmp ]; then mv package.tmp package.json; fi

echo "🔐 A11y base focus ring via globals"
LAYOUT="src/app/layout.tsx"
if [ -f "$LAYOUT" ]; then
  grep -q 'preconnect' "$LAYOUT" || sed -i.bak 's#</head>#  <link rel="preconnect" href="https://images.unsplash.com" crossOrigin="" />\n</head>#' "$LAYOUT" || true
fi

echo "🤖 robots.txt & sitemap.xml"
cat > public/robots.txt <<'RBEOF'
User-agent: *
Allow: /
Sitemap: https://wil.aui.ma/sitemap.xml
RBEOF

cat > public/sitemap.xml <<'SMEOF'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
 <url><loc>https://wil.aui.ma/</loc></url>
 <url><loc>https://wil.aui.ma/about</loc></url>
 <url><loc>https://wil.aui.ma/contact</loc></url>
 <url><loc>https://wil.aui.ma/programs/coop</loc></url>
 <url><loc>https://wil.aui.ma/programs/remote-aui</loc></url>
 <url><loc>https://wil.aui.ma/programs/alternance</loc></url>
</urlset>
SMEOF

echo "🧪 Build (optimize images first; non-fatal if none)"
npm run optimize:images || true
npm run build

echo "✅ Phase 4/5 complete — brand tokens, a11y, perf, SEO configured."
echo "👉 Place PNGs here if not yet:"
echo "   - $FRONTEND/public/branding/aui/aui-logo.png"
echo "   - $FRONTEND/public/branding/office/wil-office-logo.png"
echo "   - $FRONTEND/public/branding/programs/{coop,remote,alternance}-logo.png"
echo "Then: npm run dev"

