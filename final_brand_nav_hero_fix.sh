#!/usr/bin/env bash
set -euo pipefail
FRONTEND="$HOME/Desktop/E+E Website/wil-aui-platform/frontend"
cd "$FRONTEND"

echo "➡️ Enforce AUI brand tokens in Tailwind"
# If extend not present, create minimal config; otherwise inject/replace
if ! grep -q "brand: {.*green" tailwind.config.js 2>/dev/null; then
  # Try to append an extend block safely
  cat >> tailwind.config.js <<'EOF'

/* --- AUI brand tokens (forced) --- */
module.exports = {
  ...(module.exports || {}),
  theme: {
    ...(module.exports?.theme || {}),
    extend: {
      ...(module.exports?.theme?.extend || {}),
      colors: {
        ...(module.exports?.theme?.extend?.colors || {}),
        brand: {
          green: '#0C5F4C',
          greenDark: '#0B3C32',
          yellow: '#F6C21A',
          bg: '#F7FAF9',
          text: '#0A2721'
        }
      }
    }
  }
}
EOF
else
  # Replace any existing brand.* with the exact values
  perl -0777 -pe "s/brand:\s*\{[^}]*\}/brand: { green: '#0C5F4C', greenDark: '#0B3C32', yellow: '#F6C21A', bg: '#F7FAF9', text: '#0A2721' }/s" -i tailwind.config.js
fi

echo "➡️ Replace the homepage with required layout (WIL logo in nav, no centered hero logo, yellow title)"
cat > src/app/page.tsx <<'EOF'
'use client';

import Image from 'next/image';
import { ArrowRight, Users, Building, Award, Globe } from 'lucide-react';

const APPLY_BASE = 'https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c';

export default function HomePage() {
  const programs = [
    { id: 'coop', name: 'Co-op Program',  logo: '/branding/programs/coop-logo.png',
      description: 'Hands-on work experience aligned with your studies, earning academic credit.',
      duration: '4–8 months', highlights: ['Academic Credit','Professional Mentorship','Industry Connections'] },
    { id: 'remote', name: 'Remote@AUI',  logo: '/branding/programs/remote-logo.png',
      description: 'Task-based, remote projects with global teams—build digital-first skills.',
      duration: '3–6 months', highlights: ['Global Exposure','Digital Skills','Flexible Schedule'] },
    { id: 'alternance', name: 'Alternance Program',  logo: '/branding/programs/alternance-logo.png',
      description: 'Alternate between study and work terms to develop long-term expertise.',
      duration: '1–2 years', highlights: ['Work–Study Balance','Long-term Growth','Career Development'] },
  ];

  const stats = [
    { icon: Users, number: '500+', label: 'Students Placed' },
    { icon: Building, number: '150+', label: 'Partner Companies' },
    { icon: Award, number: '95%', label: 'Success Rate' },
    { icon: Globe, number: '25+', label: 'Countries' },
  ];

  return (
    <div className="min-h-screen bg-white">
      {/* NAVBAR: WIL Office logo on the left */}
      <nav className="bg-white shadow-lg sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-20">
            <a href="/" className="flex items-center space-x-3 focus:outline-none focus:ring-2 focus:ring-brand-green focus:ring-offset-2 rounded">
              <Image
                src="/branding/office/wil-office-logo.png"
                alt="Office of Employability & Entrepreneurship"
                width={180}
                height={50}
                className="h-12 w-auto"
                priority
              />
            </a>

            <div className="hidden md:flex items-center space-x-8">
              <a href="#home" className="text-gray-700 hover:text-brand-green transition-colors">Home</a>
              <a href="#programs" className="text-gray-700 hover:text-brand-green transition-colors">Programs</a>
              <a href="/about" className="text-gray-700 hover:text-brand-green transition-colors">About WIL</a>
              <a href="/contact" className="text-gray-700 hover:text-brand-green transition-colors">Contact</a>
            </div>

            <a
              href={APPLY_BASE}
              target="_blank" rel="noopener noreferrer"
              className="bg-brand-green text-white px-6 py-3 rounded-lg font-semibold hover:bg-brand-greenDark transition-all duration-300 shadow-lg"
            >
              Apply Now
            </a>
          </div>
        </div>
      </nav>

      {/* HERO: NO centered image; yellow title only */}
      <section id="home" className="relative bg-gradient-to-br from-brand-green to-brand-greenDark text-white">
        <div className="absolute inset-0 bg-black/10" />
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <div className="space-y-8">
              <div className="inline-flex items-center bg-white/10 backdrop-blur-sm rounded-full px-4 py-2">
                <span className="text-sm font-medium">Office of Employability & Entrepreneurship</span>
              </div>

              <h1 className="text-5xl lg:text-6xl font-extrabold leading-tight">
                <span className="text-[color:#F6C21A]">Work-Based Learning.</span>
              </h1>

              <p className="text-lg lg:text-xl text-white/90 leading-relaxed max-w-2xl">
                Bridge the gap between academic excellence and professional success through our
                Co-op, Remote@AUI, and Alternance programs designed to launch your career in Morocco and beyond.
              </p>

              <div className="flex flex-col sm:flex-row gap-4">
                <a
                  href={APPLY_BASE}
                  target="_blank" rel="noopener noreferrer"
                  className="inline-flex items-center bg-[color:#F6C21A] text-black px-8 py-4 rounded-lg font-bold text-lg hover:brightness-110 transition-all duration-300 shadow-xl"
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
            <div /> {/* deliberately empty – removes centered hero logo */}
          </div>
        </div>
      </section>

      {/* STATS */}
      <section className="bg-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-8">
            {stats.map((s, i) => (
              <div key={i} className="text-center group">
                <div className="inline-flex items-center justify-center w-16 h-16 bg-brand-green/10 rounded-full mb-4 group-hover:scale-110 transition-transform duration-300">
                  <s.icon className="h-8 w-8 text-brand-green" />
                </div>
                <div className="text-3xl font-bold text-gray-900 mb-2">{s.number}</div>
                <div className="text-gray-600 font-medium">{s.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* PROGRAMS */}
      <section id="programs" className="bg-gray-50 py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">Choose Your Path to Success</h2>
            <p className="text-xl text-gray-600 max-w-3xl mx-auto">
              Discover programs designed to accelerate your career and connect you with leading employers.
            </p>
          </div>

          <div className="grid lg:grid-cols-3 gap-8">
            {programs.map((p) => (
              <div key={p.id} className="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 overflow-hidden">
                <div className="h-32 bg-gradient-to-r from-brand-green to-brand-greenDark relative">
                  <div className="absolute inset-0 bg-black/10" />
                  <div className="relative h-full flex items-center justify-center">
                    <Image src={p.logo} alt={p.name} width={80} height={80} className="filter brightness-0 invert" />
                  </div>
                </div>
                <div className="p-8">
                  <h3 className="text-2xl font-bold text-gray-900 mb-3">{p.name}</h3>
                  <p className="text-gray-600 mb-4 leading-relaxed">{p.description}</p>
                  <div className="mb-6">
                    <div className="text-sm font-semibold text-gray-500 mb-2">Duration: {p.duration}</div>
                    <div className="space-y-2">
                      {p.highlights.map((h, idx) => (
                        <div key={idx} className="flex items-center text-sm text-gray-600">
                          <div className="w-2 h-2 bg-brand-green rounded-full mr-3" />
                          {h}
                        </div>
                      ))}
                    </div>
                  </div>
                  <div className="flex gap-3">
                    <a href={`${APPLY_BASE}?program=${p.id}`} target="_blank" rel="noopener noreferrer"
                       className="flex-1 bg-brand-green text-white px-6 py-3 rounded-lg font-semibold text-center hover:bg-brand-greenDark transition-colors">
                      Apply Now
                    </a>
                    <a href={`/programs/${p.id}`} className="px-6 py-3 border border-brand-green text-brand-green rounded-lg font-semibold hover:bg-brand-green hover:text-white transition-colors">
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
          <p className="text-xl mb-8 text-white/90">Join hundreds of AUI students who bridged classroom and career through WIL programs.</p>
          <a href={APPLY_BASE} target="_blank" rel="noopener noreferrer"
             className="inline-flex items-center bg-[color:#F6C21A] text-black px-10 py-4 rounded-lg font-bold text-xl hover:brightness-110 transition-all duration-300 shadow-xl">
            🚀 Start Your Application
            <ArrowRight className="ml-3 h-6 w-6" />
          </a>
        </div>
      </section>

      {/* FOOTER */}
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
                <p className="text-[color:#F6C21A]">wil@aui.ma</p>
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

echo "🧹 Clear Next cache and restart dev"
rm -rf .next
echo "Done. Now run: npm run dev"

