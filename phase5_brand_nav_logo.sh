#!/usr/bin/env bash
set -euo pipefail

FRONTEND="$HOME/Desktop/E+E Website/wil-aui-platform/frontend"
cd "$FRONTEND"

echo "🔧 Fix next.config.mjs (remove images.domains, add remotePatterns + redirect)"
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

echo "🎨 Ensure AUI brand tokens in tailwind.config.js"
if ! grep -q "brand: {.*green" -n tailwind.config.js; then
  # Append a minimal extend block if missing
  awk '
    /theme: *\{/ && !f { print; print "  extend: { colors: { brand: { green: '\''#0C5F4C'\'', greenDark: '\''#0B3C32'\'', yellow: '\''#F6C21A'\'', bg: '\''#F7FAF9'\'', text: '\''#0A2721'\'' } } },"; f=1; next }
    { print }
  ' tailwind.config.js > tailwind.tmp || true
  if [ -s tailwind.tmp ]; then mv tailwind.tmp tailwind.config.js; fi
fi

echo "🖼️ Update homepage: navbar uses WIL Office logo; remove hero center logo; apply brand green"
cat > src/app/page.tsx << 'EOF'
'use client';

import Image from 'next/image';
import { ArrowRight, Users, Building, Award, Globe } from 'lucide-react';

const BASE_APPLY = 'https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c';

export default function HomePage() {
  const programs = [
    {
      id: 'coop',
      name: 'Co-op Program',
      logo: '/branding/programs/coop-logo.png',
      description: 'Hands-on work experience aligned with your studies, earning academic credit.',
      duration: '4–8 months',
      highlights: ['Academic Credit', 'Professional Mentorship', 'Industry Connections'],
      gradient: 'from-brand-green to-brand-greenDark',
    },
    {
      id: 'remote',
      name: 'Remote@AUI',
      logo: '/branding/programs/remote-logo.png',
      description: 'Task-based, remote projects with global teams—build digital-first skills.',
      duration: '3–6 months',
      highlights: ['Global Exposure', 'Digital Skills', 'Flexible Schedule'],
      gradient: 'from-brand-green to-brand-greenDark',
    },
    {
      id: 'alternance',
      name: 'Alternance Program',
      logo: '/branding/programs/alternance-logo.png',
      description: 'Alternate between study and work terms to develop long-term expertise.',
      duration: '1–2 years',
      highlights: ['Work–Study Balance', 'Long-term Growth', 'Career Development'],
      gradient: 'from-brand-green to-brand-greenDark',
    },
  ];

  const stats = [
    { icon: Users, number: '500+', label: 'Students Placed', color: 'text-brand-green' },
    { icon: Building, number: '150+', label: 'Partner Companies', color: 'text-brand-green' },
    { icon: Award, number: '95%', label: 'Success Rate', color: 'text-brand-green' },
    { icon: Globe, number: '25+', label: 'Countries', color: 'text-brand-green' },
  ];

  return (
    <div className="min-h-screen bg-brand-bg">
      {/* Navbar with WIL Office logo */}
      <nav className="bg-white shadow-lg sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-20">
            <a href="/" className="flex items-center space-x-3 focus:outline-none focus:ring-2 focus:ring-brand-green focus:ring-offset-2 rounded">
              <Image
                src="/branding/office/wil-office-logo.png"
                alt="Office of Employability & Entrepreneurship"
                width={144}
                height={40}
                className="h-10 md:h-12 w-auto"
                priority
              />
              <div className="hidden md:block">
                <h1 className="text-lg font-bold text-brand-green">Work-Based Learning</h1>
                <p className="text-xs text-gray-600">Al Akhawayn University</p>
              </div>
            </a>

            <div className="hidden md:flex items-center space-x-8">
              <a href="#home" className="text-gray-700 hover:text-brand-green transition-colors">Home</a>
              <a href="#programs" className="text-gray-700 hover:text-brand-green transition-colors">Programs</a>
              <a href="/about" className="text-gray-700 hover:text-brand-green transition-colors">About WIL</a>
              <a href="/contact" className="text-gray-700 hover:text-brand-green transition-colors">Contact</a>
            </div>

            <a
              href={BASE_APPLY}
              target="_blank"
              rel="noopener noreferrer"
              className="bg-brand-green text-white px-6 py-3 rounded-lg font-semibold hover:bg-brand-greenDark transition-all duration-300 shadow-lg"
            >
              Apply Now
            </a>
          </div>
        </div>
      </nav>

      {/* Hero (text-only, no centered logo) */}
      <section id="home" className="relative bg-gradient-to-br from-brand-green to-brand-greenDark text-white">
        <div className="absolute inset-0 bg-black/10" />
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <div className="space-y-8">
              <div className="inline-flex items-center bg-white/10 backdrop-blur-sm rounded-full px-4 py-2">
                <span className="text-sm font-medium">Office of Employability & Entrepreneurship</span>
              </div>

              <h1 className="text-5xl lg:text-6xl font-bold leading-tight">
                Work-Based Learning
                <span className="block text-brand-yellow">at Al Akhawayn University</span>
              </h1>

              <p className="text-lg lg:text-xl text-white/90 leading-relaxed">
                Bridge the gap between academic excellence and professional success through Co-op,
                Remote@AUI, and Alternance programs.
              </p>

              <div className="flex flex-col sm:flex-row gap-4">
                <a
                  href={BASE_APPLY}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center bg-brand-yellow text-black px-8 py-4 rounded-lg font-bold text-lg hover:brightness-110 transition-all duration-300 shadow-xl"
                >
                  🚀 Apply Now
                  <ArrowRight className="ml-2 h-5 w-5" />
                </a>
                <a
                  href="#programs"
                  className="inline-flex items-center border border-white/70 text-white px-8 py-4 rounded-lg font-semibold text-lg hover:bg-white/10 transition-all duration-300"
                >
                  📚 Explore Programs
                </a>
              </div>
            </div>
            <div />
          </div>
        </div>
      </section>

      {/* Stats */}
      <section className="bg-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-8">
            {stats.map((stat, i) => (
              <div key={i} className="text-center group">
                <div className="inline-flex items-center justify-center w-16 h-16 bg-brand-green/10 rounded-full mb-4 group-hover:scale-110 transition-transform duration-300">
                  <stat.icon className={`h-8 w-8 ${stat.color}`} />
                </div>
                <div className="text-3xl font-bold text-gray-900 mb-2">{stat.number}</div>
                <div className="text-gray-600 font-medium">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Programs */}
      <section id="programs" className="bg-gray-50 py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">Choose Your Path to Success</h2>
            <p className="text-xl text-gray-600 max-w-3xl mx-auto">
              Discover programs designed to accelerate your career and connect you with leading employers.
            </p>
          </div>

          <div className="grid lg:grid-cols-3 gap-8">
            {programs.map((program) => (
              <div key={program.id} className="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 overflow-hidden">
                <div className={`h-32 bg-gradient-to-r ${program.gradient} relative`}>
                  <div className="absolute inset-0 bg-black/10" />
                  <div className="relative h-full flex items-center justify-center">
                    <Image
                      src={program.logo}
                      alt={program.name}
                      width={80}
                      height={80}
                      className="filter brightness-0 invert"
                    />
                  </div>
                </div>

                <div className="p-8">
                  <h3 className="text-2xl font-bold text-gray-900 mb-3">{program.name}</h3>
                  <p className="text-gray-600 mb-4 leading-relaxed">{program.description}</p>

                  <div className="mb-6">
                    <div className="text-sm font-semibold text-gray-500 mb-2">Duration: {program.duration}</div>
                    <div className="space-y-2">
                      {program.highlights.map((h, idx) => (
                        <div key={idx} className="flex items-center text-sm text-gray-600">
                          <div className="w-2 h-2 bg-brand-green rounded-full mr-3" />
                          {h}
                        </div>
                      ))}
                    </div>
                  </div>

                  <div className="flex gap-3">
                    <a
                      href={`${BASE_APPLY}?program=${program.id}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="flex-1 bg-brand-green text-white px-6 py-3 rounded-lg font-semibold text-center hover:bg-brand-greenDark transition-colors"
                    >
                      Apply Now
                    </a>
                    <a
                      href={`/programs/${program.id}`}
                      className="px-6 py-3 border border-brand-green text-brand-green rounded-lg font-semibold hover:bg-brand-green hover:text-white transition-colors"
                    >
                      Learn More
                    </a>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="bg-gradient-to-r from-brand-green to-brand-greenDark text-white py-20">
        <div className="max-w-4xl mx-auto text-center px-4 sm:px-6 lg:px-8">
          <h2 className="text-4xl font-bold mb-6">Ready to Launch Your Career?</h2>
          <p className="text-xl mb-8 text-white/90">
            Join hundreds of AUI students who bridged classroom and career through WIL programs.
          </p>
          <a
            href={BASE_APPLY}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center bg-brand-yellow text-black px-10 py-4 rounded-lg font-bold text-xl hover:brightness-110 transition-all duration-300 shadow-xl"
          >
            🚀 Start Your Application
            <ArrowRight className="ml-3 h-6 w-6" />
          </a>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-12">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid lg:grid-cols-4 gap-8">
            <div className="lg:col-span-2">
              <div className="flex items-center space-x-4 mb-4">
                <Image src="/branding/aui/aui-logo.png" alt="Al Akhawayn University" width={50} height={50} />
                <div>
                  <h3 className="text-xl font-bold">Work-Based Learning</h3>
                  <p className="text-gray-400">Al Akhawayn University</p>
                </div>
              </div>
              <p className="text-gray-400 leading-relaxed">
                Empowering students to bridge academic excellence and professional success through work-based learning.
              </p>
            </div>

            <div>
              <h4 className="text-lg font-semibold mb-4">Quick Links</h4>
              <ul className="space-y-2 text-gray-400">
                <li><a href="#home" className="hover:text-white transition-colors">Home</a></li>
                <li><a href="#programs" className="hover:text-white transition-colors">Programs</a></li>
                <li><a href="/about" className="hover:text-white transition-colors">About WIL</a></li>
                <li><a href="/contact" className="hover:text-white transition-colors">Contact</a></li>
              </ul>
            </div>

            <div>
              <h4 className="text-lg font-semibold mb-4">Contact</h4>
              <div className="space-y-2 text-gray-400">
                <p>Office of Employability & Entrepreneurship</p>
                <p>Al Akhawayn University</p>
                <p>Ifrane, Morocco</p>
                <p className="text-brand-yellow">wil@aui.ma</p>
              </div>
            </div>
          </div>

          <div className="mt-8 pt-8 text-center text-gray-400 border-t border-white/10">
            <p>&copy; 2025 Al Akhawayn University. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
}
EOF

echo "✅ Patching complete. Restart dev server:"
echo "   cd \"$FRONTEND\" && npm run dev"

