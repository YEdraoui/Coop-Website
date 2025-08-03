#!/usr/bin/env bash
set -euo pipefail
FRONTEND="$HOME/Desktop/E+E Website/wil-aui-platform/frontend"
cd "$FRONTEND"

# 1) Overwrite homepage to use ONLY green/yellow and fix Learn More routing
cat > src/app/page.tsx <<'EOF'
'use client';

import Image from 'next/image';

const APPLY_BASE = 'https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c';

type Program = {
  id: 'coop'|'remote'|'alternance';
  route: string;        // page route
  applyParam: string;   // query param for RecruitCRM
  name: string;
  logo: string;
  description: string;
  duration: string;
  highlights: string[];
};

const programs: Program[] = [
  {
    id: 'coop',
    route: '/programs/coop',
    applyParam: 'coop',
    name: 'Co-op Program',
    logo: '/branding/programs/coop-logo.png',
    description: 'Hands-on work experience aligned with your studies, earning academic credit.',
    duration: '4–8 months',
    highlights: ['Academic Credit','Professional Mentorship','Industry Connections'],
  },
  {
    id: 'remote',
    route: '/programs/remote-aui',     // <- actual route (no 404)
    applyParam: 'remote',              // <- what we send to RecruitCRM
    name: 'Remote@AUI',
    logo: '/branding/programs/remote-logo.png',
    description: 'Task-based, remote projects with global teams—build digital-first skills.',
    duration: '3–6 months',
    highlights: ['Global Exposure','Digital Skills','Flexible Schedule'],
  },
  {
    id: 'alternance',
    route: '/programs/alternance',
    applyParam: 'alternance',
    name: 'Alternance Program',
    logo: '/branding/programs/alternance-logo.png',
    description: 'Alternate between study and work terms to develop long-term expertise.',
    duration: '1–2 years',
    highlights: ['Work–Study Balance','Long-term Growth','Career Development'],
  },
];

export default function HomePage() {
  return (
    <div className="min-h-screen bg-white">
      {/* NAVBAR — WIL Office logo */}
      <nav className="bg-white shadow-lg sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-20">
            <a href="/" className="flex items-center space-x-3 focus:outline-none focus:ring-2 focus:ring-[#0C5F4C] focus:ring-offset-2 rounded">
              <Image
                src="/branding/office/wil-office-logo.png"
                alt="Office of Employability & Entrepreneurship"
                width={180} height={50} className="h-12 w-auto" priority
              />
            </a>

            <div className="hidden md:flex items-center space-x-8">
              <a href="#home" className="text-gray-800 hover:text-[#0C5F4C] transition-colors">Home</a>
              <a href="#programs" className="text-gray-800 hover:text-[#0C5F4C] transition-colors">Programs</a>
              <a href="/about" className="text-gray-800 hover:text-[#0C5F4C] transition-colors">About WIL</a>
              <a href="/contact" className="text-gray-800 hover:text-[#0C5F4C] transition-colors">Contact</a>
            </div>

            <a
              href={APPLY_BASE}
              target="_blank" rel="noopener noreferrer"
              className="bg-[#0C5F4C] text-white px-6 py-3 rounded-lg font-semibold hover:bg-[#0B3C32] transition-all duration-300 shadow-lg"
            >
              Apply Now
            </a>
          </div>
        </div>
      </nav>

      {/* HERO — ONLY green + yellow */}
      <section id="home" className="relative bg-gradient-to-br from-[#0C5F4C] to-[#0B3C32] text-white">
        <div className="absolute inset-0 bg-black/10" />
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <div className="space-y-8">
              <div className="inline-flex items-center bg-white/10 backdrop-blur-sm rounded-full px-4 py-2">
                <span className="text-sm font-medium">Office of Employability & Entrepreneurship</span>
              </div>

              <h1 className="text-5xl lg:text-6xl font-extrabold leading-tight">
                <span className="text-[#F6C21A]">Work-Based Learning.</span>
              </h1>

              <p className="text-lg lg:text-xl text-white/90 leading-relaxed max-w-2xl">
                Bridge the gap between academic excellence and professional success through our
                Co-op, Remote@AUI, and Alternance programs.
              </p>

              <div className="flex flex-col sm:flex-row gap-4">
                <a
                  href={APPLY_BASE} target="_blank" rel="noopener noreferrer"
                  className="inline-flex items-center bg-[#F6C21A] text-black px-8 py-4 rounded-lg font-bold text-lg hover:brightness-110 transition-all duration-300 shadow-xl"
                >
                  🚀 Apply Now
                </a>
                <a
                  href="#programs"
                  className="inline-flex items-center border border-white/70 text-white px-8 py-4 rounded-lg font-semibold text-lg hover:bg-white/10 transition-all duration-300"
                >
                  📚 Explore Programs
                </a>
              </div>
            </div>
            <div /> {/* no centered logo */}
          </div>
        </div>
      </section>

      {/* PROGRAMS */}
      <section id="programs" className="bg-gray-50 py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">Choose Your Path to Success</h2>
            <p className="text-xl text-gray-700 max-w-3xl mx-auto">
              Discover programs designed to accelerate your career and connect you with leading employers.
            </p>
          </div>

          <div className="grid lg:grid-cols-3 gap-8">
            {programs.map((p) => (
              <div key={p.id} className="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 overflow-hidden">
                <div className="h-32 bg-gradient-to-r from-[#0C5F4C] to-[#0B3C32] relative">
                  <div className="absolute inset-0 bg-black/10" />
                  <div className="relative h-full flex items-center justify-center">
                    <Image src={p.logo} alt={p.name} width={80} height={80} className="filter brightness-0 invert" />
                  </div>
                </div>

                <div className="p-8">
                  <h3 className="text-2xl font-bold text-gray-900 mb-3">{p.name}</h3>
                  <p className="text-gray-700 mb-4 leading-relaxed">{p.description}</p>

                  <div className="mb-6">
                    <div className="text-sm font-semibold text-gray-600 mb-2">Duration: {p.duration}</div>
                    <div className="space-y-2">
                      {p.highlights.map((h, idx) => (
                        <div key={idx} className="flex items-center text-sm text-gray-700">
                          <div className="w-2 h-2 bg-[#0C5F4C] rounded-full mr-3" />
                          {h}
                        </div>
                      ))}
                    </div>
                  </div>

                  <div className="flex gap-3">
                    <a
                      href={`${APPLY_BASE}?program=${p.applyParam}`} target="_blank" rel="noopener noreferrer"
                      className="flex-1 bg-[#0C5F4C] text-white px-6 py-3 rounded-lg font-semibold text-center hover:bg-[#0B3C32] transition-colors"
                    >
                      Apply Now
                    </a>
                    <a
                      href={p.route}
                      className="px-6 py-3 border border-[#0C5F4C] text-[#0C5F4C] rounded-lg font-semibold hover:bg-[#0C5F4C] hover:text-white transition-colors"
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
      <section className="bg-gradient-to-r from-[#0C5F4C] to-[#0B3C32] text-white py-20">
        <div className="max-w-4xl mx-auto text-center px-4 sm:px-6 lg:px-8">
          <h2 className="text-4xl font-bold mb-6">Ready to Launch Your Career?</h2>
          <p className="text-xl mb-8 text-white/90">
            Join hundreds of AUI students who bridged classroom and career through WIL programs.
          </p>
          <a
            href={APPLY_BASE} target="_blank" rel="noopener noreferrer"
            className="inline-flex items-center bg-[#F6C21A] text-black px-10 py-4 rounded-lg font-bold text-xl hover:brightness-110 transition-all duration-300 shadow-xl"
          >
            🚀 Start Your Application
          </a>
        </div>
      </section>

      {/* FOOTER (no blue links) */}
      <footer className="bg-[#0A0F12] text-white py-12">
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
              <ul className="space-y-2">
                <li><a href="#home" className="text-gray-300 hover:text-[#F6C21A] transition-colors">Home</a></li>
                <li><a href="#programs" className="text-gray-300 hover:text-[#F6C21A] transition-colors">Programs</a></li>
                <li><a href="/about" className="text-gray-300 hover:text-[#F6C21A] transition-colors">About WIL</a></li>
                <li><a href="/contact" className="text-gray-300 hover:text-[#F6C21A] transition-colors">Contact</a></li>
              </ul>
            </div>

            <div>
              <h4 className="text-lg font-semibold mb-4">Contact</h4>
              <div className="space-y-2 text-gray-300">
                <p>Office of Employability & Entrepreneurship</p>
                <p>Al Akhawayn University</p>
                <p>Ifrane, Morocco</p>
                <p className="text-[#F6C21A]">wil@aui.ma</p>
              </div>
            </div>
          </div>

          <div className="mt-8 pt-8 text-center text-gray-500 border-t border-white/10">
            <p>&copy; 2025 Al Akhawayn University. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
}
EOF

# 2) Ensure minimal program pages exist (no 404)
mkdir -p src/app/programs/coop src/app/programs/remote-aui src/app/programs/alternance

for P in coop remote-aui alternance; do
  FILE="src/app/programs/$P/page.tsx"
  if [ ! -f "$FILE" ]; then
    cat > "$FILE" <<EOF2
export default function Page() {
  return (
    <main className="min-h-screen bg-white">
      <section className="max-w-5xl mx-auto px-4 py-16">
        <h1 className="text-4xl font-bold mb-4 capitalize">$P</h1>
        <p className="text-gray-700 mb-6">Program details will be published here.</p>
        <a
          href="https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c?program=${P=='remote-aui' ? 'remote' : P}"
          target="_blank" rel="noopener noreferrer"
          className="inline-block bg-[#0C5F4C] text-white px-6 py-3 rounded-lg hover:bg-[#0B3C32]"
        >
          Apply Now
        </a>
      </section>
    </main>
  );
}
EOF2
  fi
done

# 3) Clear Next cache for a clean rebuild
rm -rf .next
echo "✅ Done. Now run: npm run dev"

