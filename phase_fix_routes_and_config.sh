#!/usr/bin/env bash
set -euo pipefail

ROOT="$HOME/Desktop/E+E Website/wil-aui-platform/frontend"
cd "$ROOT"

echo "🔧 Writing next.config.mjs (remotePatterns + redirect /programs/remote → /programs/remote-aui)"
cat > next.config.mjs <<'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    remotePatterns: [
      { protocol: 'https', hostname: 'images.unsplash.com' }
    ]
  },
  async redirects() {
    return [
      { source: '/programs/remote', destination: '/programs/remote-aui', permanent: true },
    ];
  }
}
export default nextConfig;
EOF

echo "📁 Ensuring route folders exist"
mkdir -p src/app/about
mkdir -p src/app/contact
mkdir -p src/app/programs/coop
mkdir -p src/app/programs/remote-aui
mkdir -p src/app/programs/alternance

echo "📝 Minimal About page"
cat > src/app/about/page.tsx <<'EOF'
export default function Page() {
  return (
    <main className="min-h-screen bg-gray-50">
      <section className="max-w-5xl mx-auto px-4 py-16">
        <h1 className="text-4xl font-bold mb-4">About Work-Based Learning</h1>
        <p className="text-gray-700">
          WIL at AUI bridges academic excellence with professional experience across Co-op, Remote@AUI, and Alternance.
        </p>
      </section>
    </main>
  );
}
EOF

echo "📝 Minimal Contact page"
cat > src/app/contact/page.tsx <<'EOF'
export default function Page() {
  return (
    <main className="min-h-screen bg-gray-50">
      <section className="max-w-5xl mx-auto px-4 py-16">
        <h1 className="text-4xl font-bold mb-4">Contact</h1>
        <div className="text-gray-700 space-y-1">
          <p>Office of Employability & Entrepreneurship</p>
          <p>Al Akhawayn University, Ifrane, Morocco</p>
          <p>Email: <a className="text-blue-700 underline" href="mailto:wil@aui.ma">wil@aui.ma</a></p>
        </div>
      </section>
    </main>
  );
}
EOF

echo "📝 Minimal Program: Co-op"
cat > src/app/programs/coop/page.tsx <<'EOF'
export default function Page() {
  return (
    <main className="min-h-screen bg-gray-50">
      <section className="max-w-5xl mx-auto px-4 py-16">
        <h1 className="text-4xl font-bold mb-4">Co-op Program</h1>
        <p className="text-gray-700 mb-6">Hands-on experience with academic credit and mentorship.</p>
        <a
          href="https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c?program=coop"
          target="_blank" rel="noopener noreferrer"
          className="inline-block bg-blue-700 text-white px-6 py-3 rounded-lg"
        >
          Apply for Co-op
        </a>
      </section>
    </main>
  );
}
EOF

echo "📝 Minimal Program: Remote@AUI"
cat > src/app/programs/remote-aui/page.tsx <<'EOF'
export default function Page() {
  return (
    <main className="min-h-screen bg-gray-50">
      <section className="max-w-5xl mx-auto px-4 py-16">
        <h1 className="text-4xl font-bold mb-4">Remote@AUI</h1>
        <p className="text-gray-700 mb-6">Remote, task-based projects with global teams.</p>
        <a
          href="https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c?program=remote"
          target="_blank" rel="noopener noreferrer"
          className="inline-block bg-green-700 text-white px-6 py-3 rounded-lg"
        >
          Apply for Remote@AUI
        </a>
      </section>
    </main>
  );
}
EOF

echo "📝 Minimal Program: Alternance"
cat > src/app/programs/alternance/page.tsx <<'EOF'
export default function Page() {
  return (
    <main className="min-h-screen bg-gray-50">
      <section className="max-w-5xl mx-auto px-4 py-16">
        <h1 className="text-4xl font-bold mb-4">Alternance Program</h1>
        <p className="text-gray-700 mb-6">Alternate study and work terms for long-term growth.</p>
        <a
          href="https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c?program=alternance"
          target="_blank" rel="noopener noreferrer"
          className="inline-block bg-purple-700 text-white px-6 py-3 rounded-lg"
        >
          Apply for Alternance
        </a>
      </section>
    </main>
  );
}
EOF

echo "🧭 Branded 404 page"
cat > src/app/not-found.tsx <<'EOF'
export default function NotFound() {
  return (
    <main className="min-h-screen grid place-items-center bg-gray-50 px-4">
      <div className="text-center">
        <h1 className="text-5xl font-bold mb-2">404</h1>
        <p className="text-gray-600 mb-6">The page you’re looking for doesn’t exist.</p>
        <a href="/" className="inline-block bg-blue-700 text-white px-6 py-3 rounded-lg">Go Home</a>
      </div>
    </main>
  );
}
EOF

echo "♻️ Restart the dev server to apply config changes"
echo "   Tip: Ctrl+C then: cd \"$ROOT\" && npm run dev"

