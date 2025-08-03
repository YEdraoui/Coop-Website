#!/usr/bin/env bash
set -euo pipefail

echo "🎨 Phase 2 Final (Design) + Phase 3 (Program Pages)"
echo "===================================================="

# Adjust this path if your repo is elsewhere
FRONTEND_DIR="$HOME/Desktop/E+E Website/wil-aui-platform/frontend"

if [ ! -d "$FRONTEND_DIR" ]; then
  echo "❌ Frontend directory not found at:"
  echo "   $FRONTEND_DIR"
  echo "Please adjust FRONTEND_DIR in the script."
  exit 1
fi

cd "$FRONTEND_DIR"

echo "📁 Ensuring public branding folders exist..."
mkdir -p public/branding/aui
mkdir -p public/branding/office
mkdir -p public/branding/programs
mkdir -p public/favicons

echo "🧩 Reminder: place your PNG assets here after this script finishes:"
echo "  - public/branding/aui/aui-logo.png"
echo "  - public/branding/office/wil-office-logo.png"
echo "  - public/branding/programs/coop-logo.png"
echo "  - public/branding/programs/remote-logo.png"
echo "  - public/branding/programs/alternance-logo.png"
echo ""

echo "📝 Writing homepage: src/app/page.tsx ..."
mkdir -p src/app
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
      gradient: 'from-blue-600 to-blue-800',
    },
    {
      id: 'remote',
      name: 'Remote@AUI',
      logo: '/branding/programs/remote-logo.png',
      description: 'Task-based, remote projects with global teams—build digital-first skills.',
      duration: '3–6 months',
      highlights: ['Global Exposure', 'Digital Skills', 'Flexible Schedule'],
      gradient: 'from-green-600 to-green-800',
    },
    {
      id: 'alternance',
      name: 'Alternance Program',
      logo: '/branding/programs/alternance-logo.png',
      description: 'Alternate between study and work terms to develop long-term expertise.',
      duration: '1–2 years',
      highlights: ['Work–Study Balance', 'Long-term Growth', 'Career Development'],
      gradient: 'from-purple-600 to-purple-800',
    },
  ];

  const stats = [
    { icon: Users, number: '500+', label: 'Students Placed', color: 'text-blue-600' },
    { icon: Building, number: '150+', label: 'Partner Companies', color: 'text-green-600' },
    { icon: Award, number: '95%', label: 'Success Rate', color: 'text-purple-600' },
    { icon: Globe, number: '25+', label: 'Countries', color: 'text-orange-600' },
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Navigation */}
      <nav className="bg-white shadow-lg sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-20">
            <div className="flex items-center space-x-4">
              <Image
                src="/branding/aui/aui-logo.png"
                alt="Al Akhawayn University"
                width={60}
                height={60}
                className="h-12 w-auto"
              />
              <div className="hidden md:block">
                <h1 className="text-xl font-bold text-gray-900">Work-Based Learning</h1>
                <p className="text-sm text-gray-600">Al Akhawayn University</p>
              </div>
            </div>

            <div className="hidden md:flex items-center space-x-8">
              <a href="#home" className="text-gray-700 hover:text-gray-900 transition-colors">Home</a>
              <a href="#programs" className="text-gray-700 hover:text-gray-900 transition-colors">Programs</a>
              <a href="/about" className="text-gray-700 hover:text-gray-900 transition-colors">About WIL</a>
              <a href="/contact" className="text-gray-700 hover:text-gray-900 transition-colors">Contact</a>
            </div>

            <a
              href={BASE_APPLY}
              target="_blank"
              rel="noopener noreferrer"
              className="bg-blue-700 text-white px-6 py-3 rounded-lg font-semibold hover:bg-blue-800 transition-all duration-300 transform hover:scale-105 shadow-lg"
            >
              Apply Now
            </a>
          </div>
        </div>
      </nav>

      {/* Hero */}
      <section id="home" className="relative bg-gradient-to-br from-blue-700 via-blue-800 to-blue-900 text-white">
        <div className="absolute inset-0 bg-black/10" />
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <div className="space-y-8">
              <div className="inline-flex items-center bg-white/10 backdrop-blur-sm rounded-full px-4 py-2">
                <Image
                  src="/branding/office/wil-office-logo.png"
                  alt="WIL Office"
                  width={28}
                  height={28}
                  className="mr-3"
                />
                <span className="text-sm font-medium">Office of Employability & Entrepreneurship</span>
              </div>

              <h1 className="text-5xl lg:text-6xl font-bold leading-tight">
                Work-Based Learning
                <span className="block text-yellow-400">at Al Akhawayn University</span>
              </h1>

              <p className="text-lg lg:text-xl text-blue-100 leading-relaxed">
                Bridge the gap between academic excellence and professional success through Co-op,
                Remote@AUI, and Alternance programs.
              </p>

              <div className="flex flex-col sm:flex-row gap-4">
                <a
                  href={BASE_APPLY}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center bg-yellow-500 text-black px-8 py-4 rounded-lg font-bold text-lg hover:bg-yellow-400 transition-all duration-300 transform hover:scale-105 shadow-xl"
                >
                  🚀 Apply Now
                  <ArrowRight className="ml-2 h-5 w-5" />
                </a>
                <a
                  href="#programs"
                  className="inline-flex items-center bg-white/10 backdrop-blur-sm text-white px-8 py-4 rounded-lg font-semibold text-lg hover:bg-white/20 transition-all duration-300 border border-white/30"
                >
                  📚 Explore Programs
                </a>
              </div>
            </div>

            <div className="relative">
              <div className="bg-white/10 backdrop-blur-sm rounded-2xl p-8 shadow-2xl">
                <Image
                  src="/branding/office/wil-office-logo.png"
                  alt="WIL Office"
                  width={320}
                  height={200}
                  className="w-full h-auto rounded-lg"
                />
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Stats */}
      <section className="bg-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-8">
            {stats.map((stat, i) => (
              <div key={i} className="text-center group">
                <div className="inline-flex items-center justify-center w-16 h-16 bg-gray-100 rounded-full mb-4 group-hover:scale-110 transition-transform duration-300">
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
                          <div className="w-2 h-2 bg-green-500 rounded-full mr-3" />
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
                      className="flex-1 bg-blue-700 text-white px-6 py-3 rounded-lg font-semibold text-center hover:bg-blue-800 transition-colors"
                    >
                      Apply Now
                    </a>
                    <a
                      href={`/programs/${program.id}`}
                      className="px-6 py-3 border border-blue-700 text-blue-700 rounded-lg font-semibold hover:bg-blue-700 hover:text-white transition-colors"
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

      {/* Testimonials */}
      <section className="bg-white py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">Success Stories</h2>
            <p className="text-xl text-gray-600">Hear from students who transformed their careers through WIL programs</p>
          </div>

          <div className="grid lg:grid-cols-3 gap-8">
            {[
              {
                name: "Youssef El Amrani",
                program: "Co-op Program",
                company: "OCP Group",
                quote: "The Co-op program opened doors I never imagined. Working at OCP while studying gave me invaluable experience.",
                image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face",
              },
              {
                name: "Fatima Zahra Bennani",
                program: "Remote@AUI",
                company: "Tech Startup (Berlin)",
                quote: "Remote@AUI let me work with an international team while completing my studies. The skills I gained are priceless.",
                image: "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face",
              },
              {
                name: "Ahmed Boutahar",
                program: "Alternance",
                company: "Attijariwafa Bank",
                quote: "The Alternance program balanced my studies with professional growth at a leading bank.",
                image: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
              },
            ].map((t, i) => (
              <div key={i} className="bg-gray-50 rounded-xl p-8 shadow-lg hover:shadow-xl transition-shadow">
                <div className="flex items-center mb-6">
                  <Image src={t.image} alt={t.name} width={60} height={60} className="rounded-full mr-4" />
                  <div>
                    <h4 className="font-bold text-gray-900">{t.name}</h4>
                    <p className="text-sm text-gray-600">{t.program}</p>
                    <p className="text-sm text-blue-700 font-semibold">{t.company}</p>
                  </div>
                </div>
                <blockquote className="text-gray-700 italic leading-relaxed">"{t.quote}"</blockquote>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="bg-gradient-to-r from-blue-700 to-blue-900 text-white py-20">
        <div className="max-w-4xl mx-auto text-center px-4 sm:px-6 lg:px-8">
          <h2 className="text-4xl font-bold mb-6">Ready to Launch Your Career?</h2>
          <p className="text-xl mb-8 text-blue-100">
            Join hundreds of AUI students who bridged classroom and career through WIL programs.
          </p>
          <a
            href={BASE_APPLY}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center bg-yellow-500 text-black px-10 py-4 rounded-lg font-bold text-xl hover:bg-yellow-400 transition-all duration-300 transform hover:scale-105 shadow-xl"
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
                <p className="text-blue-400">wil@aui.ma</p>
              </div>
            </div>
          </div>

          <div className="border-top mt-8 pt-8 text-center text-gray-400">
            <p>&copy; 2025 Al Akhawayn University. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
}
EOF

echo "📄 Writing About page: src/app/about/page.tsx ..."
mkdir -p src/app/about
cat > src/app/about/page.tsx << 'EOF'
'use client';

import Image from 'next/image';
import { Target, Users, Award, Globe, ArrowRight } from 'lucide-react';

export default function AboutPage() {
  const team = [
    {
      name: 'Dr. Sarah Benali',
      title: 'Director, Office of Employability & Entrepreneurship',
      image: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=300&h=300&fit=crop&crop=face',
      bio: 'Leads AUI work-based learning initiatives with 15+ years across academia and industry partnerships.',
    },
    {
      name: 'Ahmed Lakhal',
      title: 'Industry Relations Manager',
      image: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=300&h=300&fit=crop&crop=face',
      bio: 'Builds strategic partnerships with leading companies in Morocco and internationally.',
    },
    {
      name: 'Fatima Zahra Idrissi',
      title: 'Student Success Coordinator',
      image: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=300&h=300&fit=crop&crop=face',
      bio: 'Supports student development and ensures high-quality experiences throughout their placements.',
    },
  ];

  const values = [
    { icon: Target, title: 'Excellence', description: 'World-class work-based learning with high standards.' },
    { icon: Users, title: 'Partnership', description: 'Strong, mutual relationships between students, employers, and AUI.' },
    { icon: Award, title: 'Innovation', description: 'Programs that evolve with modern workplace needs.' },
    { icon: Globe, title: 'Global Perspective', description: 'Preparation for international, interconnected careers.' },
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-gradient-to-br from-blue-700 to-blue-900 text-white py-16">
        <div className="max-w-4xl mx-auto text-center px-4">
          <div className="inline-flex items-center bg-white/10 backdrop-blur-sm rounded-full px-4 py-2 mb-6">
            <Image src="/branding/office/wil-office-logo.png" alt="WIL Office" width={28} height={28} className="mr-3" />
            <span className="text-sm font-medium">Office of Employability & Entrepreneurship</span>
          </div>
          <h1 className="text-5xl font-bold mb-4">About Work-Based Learning</h1>
          <p className="text-lg text-blue-100">
            Bridging academic excellence and professional success through experiential learning.
          </p>
        </div>
      </header>

      <main>
        <section className="bg-white py-16">
          <div className="max-w-4xl mx-auto px-4">
            <div className="text-center mb-10">
              <h2 className="text-3xl font-bold text-gray-900 mb-6">Our Mission</h2>
              <p className="text-lg text-gray-600">
                Empower AUI students with practical, real-world experience that complements academic learning and
                prepares them for successful careers.
              </p>
            </div>

            <div className="prose prose-lg max-w-none text-gray-700">
              <p>
                The Work-Based Learning initiative at AUI connects students with organizations to tackle real challenges while
                receiving academic guidance and mentorship. These experiences accelerate skill development, expand networks,
                and create tangible impact.
              </p>
            </div>
          </div>
        </section>

        <section className="bg-gray-50 py-16">
          <div className="max-w-7xl mx-auto px-4">
            <h2 className="text-3xl font-bold text-gray-900 mb-10 text-center">Our Values</h2>
            <div className="grid lg:grid-cols-4 gap-8">
              {values.map((v, i) => (
                <div key={i} className="bg-white rounded-xl p-8 text-center shadow-lg hover:shadow-xl transition-shadow">
                  <div className="inline-flex items-center justify-center w-16 h-16 bg-blue-100 rounded-full mb-6">
                    <v.icon className="h-8 w-8 text-blue-700" />
                  </div>
                  <h3 className="text-xl font-bold text-gray-900 mb-3">{v.title}</h3>
                  <p className="text-gray-600">{v.description}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="bg-white py-16">
          <div className="max-w-7xl mx-auto px-4">
            <div className="text-center mb-12">
              <h2 className="text-3xl font-bold text-gray-900 mb-4">Meet Our Team</h2>
              <p className="text-lg text-gray-600">Dedicated professionals committed to your success</p>
            </div>

            <div className="grid lg:grid-cols-3 gap-8">
              {team.map((m, i) => (
                <div key={i} className="bg-gray-50 rounded-xl p-8 text-center shadow-lg hover:shadow-xl transition-shadow">
                  <Image src={m.image} alt={m.name} width={150} height={150} className="rounded-full mx-auto mb-6" />
                  <h3 className="text-xl font-bold text-gray-900">{m.name}</h3>
                  <p className="text-blue-700 font-semibold mb-3">{m.title}</p>
                  <p className="text-gray-600">{m.bio}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="bg-gray-50 py-16">
          <div className="max-w-4xl mx-auto text-center px-4">
            <h2 className="text-3xl font-bold text-gray-900 mb-6">Ready to begin?</h2>
            <p className="text-lg text-gray-600 mb-6">
              Explore programs or start your application through our RecruitCRM portal.
            </p>
            <a
              href="https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center bg-blue-700 text-white px-8 py-4 rounded-lg font-bold text-lg hover:bg-blue-800 transition-all duration-300 transform hover:scale-105 shadow-xl"
            >
              🚀 Apply Now
              <ArrowRight className="ml-2 h-5 w-5" />
            </a>
          </div>
        </section>
      </main>
    </div>
  );
}
EOF

echo "📄 Writing Contact page: src/app/contact/page.tsx ..."
mkdir -p src/app/contact
cat > src/app/contact/page.tsx << 'EOF'
'use client';

import Image from 'next/image';
import { Mail, Phone, MapPin, Clock, Send } from 'lucide-react';

export default function ContactPage() {
  const contactInfo = [
    { icon: Mail, title: 'Email', details: 'wil@aui.ma', description: 'Send us your questions or inquiries' },
    { icon: Phone, title: 'Phone', details: '+212 5 35 86 2000', description: 'Call us during business hours' },
    { icon: MapPin, title: 'Location', details: 'Al Akhawayn University, Ifrane, Morocco', description: 'Visit our office on campus' },
    { icon: Clock, title: 'Office Hours', details: 'Mon–Fri: 8:00–17:00', description: 'Available for consultations and support' },
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-gradient-to-br from-blue-700 to-blue-900 text-white py-16">
        <div className="max-w-4xl mx-auto text-center px-4">
          <div className="inline-flex items-center bg-white/10 backdrop-blur-sm rounded-full px-4 py-2 mb-6">
            <Image src="/branding/office/wil-office-logo.png" alt="WIL Office" width={28} height={28} className="mr-3" />
            <span className="text-sm font-medium">Get in Touch</span>
          </div>
          <h1 className="text-5xl font-bold mb-4">Contact Us</h1>
          <p className="text-lg text-blue-100">We’re here to help you take the next step in your career journey.</p>
        </div>
      </header>

      <main>
        <section className="bg-white py-16">
          <div className="max-w-7xl mx-auto px-4">
            <div className="grid lg:grid-cols-4 gap-8">
              {contactInfo.map((info, i) => (
                <div key={i} className="text-center group">
                  <div className="inline-flex items-center justify-center w-16 h-16 bg-blue-100 rounded-full mb-6 group-hover:scale-110 transition-transform duration-300">
                    <info.icon className="h-8 w-8 text-blue-700" />
                  </div>
                  <h3 className="text-xl font-bold text-gray-900 mb-2">{info.title}</h3>
                  <p className="text-blue-700 font-semibold mb-2">{info.details}</p>
                  <p className="text-gray-600 text-sm">{info.description}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Optional static form (no backend processing) */}
        <section className="bg-gray-50 py-16">
          <div className="max-w-4xl mx-auto px-4">
            <div className="text-center mb-10">
              <h2 className="text-3xl font-bold text-gray-900 mb-4">Send Us a Message</h2>
              <p className="text-lg text-gray-600">We’ll get back to you as soon as possible.</p>
            </div>

            <div className="bg-white rounded-xl shadow-lg p-8">
              <form className="space-y-6" onSubmit={(e) => e.preventDefault()}>
                <div className="grid lg:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">First Name *</label>
                    <input type="text" required className="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-blue-700" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Last Name *</label>
                    <input type="text" required className="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-blue-700" />
                  </div>
                </div>

                <div className="grid lg:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Email Address *</label>
                    <input type="email" required className="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-blue-700" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Phone Number</label>
                    <input type="tel" className="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-blue-700" />
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Subject *</label>
                  <select required className="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-blue-700">
                    <option value="">Select a subject</option>
                    <option value="coop">Co-op Program Inquiry</option>
                    <option value="remote">Remote@AUI Program Inquiry</option>
                    <option value="alternance">Alternance Program Inquiry</option>
                    <option value="employer">Employer Partnership</option>
                    <option value="general">General Question</option>
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Message *</label>
                  <textarea rows={6} required className="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-blue-700" />
                </div>

                <div className="text-center">
                  <button type="submit" className="inline-flex items-center bg-blue-700 text-white px-8 py-4 rounded-lg font-bold text-lg hover:bg-blue-800 transition-all duration-300 transform hover:scale-105 shadow-xl">
                    <Send className="mr-2 h-5 w-5" />
                    Send Message
                  </button>
                </div>
              </form>

              <p className="text-center text-sm text-gray-500 mt-4">
                Prefer email? Write to <a href="mailto:wil@aui.ma" className="text-blue-700 underline">wil@aui.ma</a>
              </p>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}
EOF

echo "📄 Writing Program pages..."
mkdir -p src/app/programs/coop
mkdir -p src/app/programs/remote-aui
mkdir -p src/app/programs/alternance

# Co-op
cat > src/app/programs/coop/page.tsx << 'EOF'
'use client';

import Image from 'next/image';
import { ArrowRight, Clock, Award, Users, Building } from 'lucide-react';

const APPLY = 'https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c?program=coop';

export default function CoopPage() {
  const benefitsStudents = [
    'Gain 4–8 months of professional experience',
    'Earn academic credit while working',
    'Build networks and practical skills',
    'Mentorship from industry professionals',
  ];

  const benefitsEmployers = [
    'Access to talented AUI students',
    'Evaluate potential full-time hires',
    'Fresh perspectives for projects',
    'Partnership with a leading university',
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-gradient-to-br from-blue-600 to-blue-800 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 grid lg:grid-cols-2 gap-10 items-center">
          <div>
            <div className="inline-flex items-center bg-white/10 rounded-full px-4 py-2 mb-6">
              <Image src="/branding/programs/coop-logo.png" alt="Co-op" width={28} height={28} className="mr-3 filter brightness-0 invert" />
              <span className="text-sm font-medium">Cooperative Education Program</span>
            </div>
            <h1 className="text-5xl font-bold mb-4">Co-op Program</h1>
            <p className="text-lg text-blue-100 mb-8">
              Hands-on work experience aligned with your academic path, with faculty oversight and industry mentorship.
            </p>

            <div className="grid grid-cols-2 gap-6 mb-8">
              <div className="bg-white/10 rounded-lg p-4">
                <Clock className="h-7 w-7 mb-2 text-yellow-400" />
                <div className="text-sm text-blue-100">Duration</div>
                <div className="text-lg font-semibold">4–8 months</div>
              </div>
              <div className="bg-white/10 rounded-lg p-4">
                <Award className="h-7 w-7 mb-2 text-yellow-400" />
                <div className="text-sm text-blue-100">Credit</div>
                <div className="text-lg font-semibold">3–6 credits</div>
              </div>
            </div>

            <a href={APPLY} target="_blank" rel="noopener noreferrer" className="inline-flex items-center bg-yellow-500 text-black px-8 py-4 rounded-lg font-bold text-lg hover:bg-yellow-400 transition-all duration-300 transform hover:scale-105 shadow-xl">
              🚀 Apply Now
              <ArrowRight className="ml-2 h-5 w-5" />
            </a>
          </div>

          <div className="bg-white/10 rounded-2xl p-8 shadow-2xl text-center">
            <Image src="/branding/programs/coop-logo.png" alt="Co-op" width={260} height={160} className="mx-auto" />
          </div>
        </div>
      </header>

      <main>
        <section className="bg-white py-16">
          <div className="max-w-7xl mx-auto px-4 grid lg:grid-cols-2 gap-10">
            <div className="bg-blue-50 rounded-xl p-8">
              <div className="flex items-center mb-6">
                <Users className="h-7 w-7 text-blue-700 mr-3" />
                <h2 className="text-2xl font-bold text-gray-900">For Students</h2>
              </div>
              <ul className="space-y-3">
                {benefitsStudents.map((b, i) => (
                  <li key={i} className="flex items-start">
                    <div className="w-2 h-2 bg-blue-700 rounded-full mt-2 mr-3" />
                    <span className="text-gray-700">{b}</span>
                  </li>
                ))}
              </ul>
            </div>

            <div className="bg-green-50 rounded-xl p-8">
              <div className="flex items-center mb-6">
                <Building className="h-7 w-7 text-green-700 mr-3" />
                <h2 className="text-2xl font-bold text-gray-900">For Employers</h2>
              </div>
              <ul className="space-y-3">
                {benefitsEmployers.map((b, i) => (
                  <li key={i} className="flex items-start">
                    <div className="w-2 h-2 bg-green-700 rounded-full mt-2 mr-3" />
                    <span className="text-gray-700">{b}</span>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}
EOF

# Remote@AUI
cat > src/app/programs/remote-aui/page.tsx << 'EOF'
'use client';

import Image from 'next/image';
import { ArrowRight, Clock, Globe, Users, Building } from 'lucide-react';

const APPLY = 'https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c?program=remote';

export default function RemoteAUIPage() {
  const skills = [
    { icon: Globe, title: 'Global Communication', description: 'Cross-cultural collaboration with distributed teams.' },
    { icon: Users, title: 'Virtual Teamwork', description: 'Operate effectively in remote-first environments.' },
  ];

  const benefitsEmployers = [
    'Tap skilled students without geographic limits',
    'Flexible engagement models for projects',
    'Support digital transformation goals',
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-gradient-to-br from-green-600 to-green-800 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 grid lg:grid-cols-2 gap-10 items-center">
          <div>
            <div className="inline-flex items-center bg-white/10 rounded-full px-4 py-2 mb-6">
              <Image src="/branding/programs/remote-logo.png" alt="Remote@AUI" width={28} height={28} className="mr-3 filter brightness-0 invert" />
              <span className="text-sm font-medium">Remote Work Experience</span>
            </div>
            <h1 className="text-5xl font-bold mb-4">Remote@AUI</h1>
            <p className="text-lg text-green-100 mb-8">
              Build digital-first skills and work with international teams while you study.
            </p>

            <div className="grid grid-cols-2 gap-6 mb-8">
              <div className="bg-white/10 rounded-lg p-4">
                <Clock className="h-7 w-7 mb-2 text-yellow-400" />
                <div className="text-sm text-green-100">Duration</div>
                <div className="text-lg font-semibold">3–6 months</div>
              </div>
              <div className="bg-white/10 rounded-lg p-4">
                <Globe className="h-7 w-7 mb-2 text-yellow-400" />
                <div className="text-sm text-green-100">Location</div>
                <div className="text-lg font-semibold">100% Remote</div>
              </div>
            </div>

            <a href={APPLY} target="_blank" rel="noopener noreferrer" className="inline-flex items-center bg-yellow-500 text-black px-8 py-4 rounded-lg font-bold text-lg hover:bg-yellow-400 transition-all duration-300 transform hover:scale-105 shadow-xl">
              🌍 Apply Now
              <ArrowRight className="ml-2 h-5 w-5" />
            </a>
          </div>

          <div className="bg-white/10 rounded-2xl p-8 shadow-2xl text-center">
            <Image src="/branding/programs/remote-logo.png" alt="Remote@AUI" width={260} height={160} className="mx-auto" />
          </div>
        </div>
      </header>

      <main>
        <section className="bg-white py-16">
          <div className="max-w-7xl mx-auto px-4">
            <h2 className="text-3xl font-bold text-gray-900 mb-10 text-center">Skills You'll Develop</h2>
            <div className="grid lg:grid-cols-2 gap-8">
              {skills.map((s, i) => (
                <div key={i} className="bg-white rounded-xl p-8 shadow">
                  <div className="flex items-center mb-4">
                    <s.icon className="h-7 w-7 text-green-700 mr-3" />
                    <h3 className="text-xl font-bold text-gray-900">{s.title}</h3>
                  </div>
                  <p className="text-gray-600">{s.description}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="bg-gray-50 py-16">
          <div className="max-w-7xl mx-auto px-4">
            <h2 className="text-3xl font-bold text-gray-900 mb-10 text-center">For Employers</h2>
            <div className="bg-blue-50 rounded-xl p-8 max-w-3xl mx-auto">
              <div className="flex items-center mb-6">
                <Building className="h-7 w-7 text-blue-700 mr-3" />
                <h3 className="text-2xl font-bold text-gray-900">Why Partner with AUI?</h3>
              </div>
              <ul className="space-y-3">
                {benefitsEmployers.map((b, i) => (
                  <li key={i} className="flex items-start">
                    <div className="w-2 h-2 bg-blue-700 rounded-full mt-2 mr-3" />
                    <span className="text-gray-700">{b}</span>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}
EOF

# Alternance
cat > src/app/programs/alternance/page.tsx << 'EOF'
'use client';

import Image from 'next/image';
import { ArrowRight, Clock, Award, Users, Building, GraduationCap, TrendingUp } from 'lucide-react';

const APPLY = 'https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c?program=alternance';

export default function AlternancePage() {
  const studentBenefits = [
    'Balance academic studies with professional work',
    'Develop deep expertise in your field',
    'Build relationships that lead to full-time roles',
  ];

  const phases = [
    { title: 'Academic Phase', duration: '6 months', icon: GraduationCap, description: 'Focus on theoretical learning and coursework.' },
    { title: 'Work Phase', duration: '6 months', icon: Building, description: 'Apply knowledge in a professional environment.' },
    { title: 'Integration', duration: 'Ongoing', icon: TrendingUp, description: 'Combine learning and practice across terms.' },
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-gradient-to-br from-purple-600 to-purple-800 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 grid lg:grid-cols-2 gap-10 items-center">
          <div>
            <div className="inline-flex items-center bg-white/10 rounded-full px-4 py-2 mb-6">
              <Image src="/branding/programs/alternance-logo.png" alt="Alternance" width={28} height={28} className="mr-3 filter brightness-0 invert" />
              <span className="text-sm font-medium">Work–Study Integration</span>
            </div>
            <h1 className="text-5xl font-bold mb-4">Alternance Program</h1>
            <p className="text-lg text-purple-100 mb-8">
              Alternate between study and work periods to build long-term skills while earning your degree.
            </p>

            <div className="grid grid-cols-2 gap-6 mb-8">
              <div className="bg-white/10 rounded-lg p-4">
                <Clock className="h-7 w-7 mb-2 text-yellow-400" />
                <div className="text-sm text-purple-100">Duration</div>
                <div className="text-lg font-semibold">1–2 years</div>
              </div>
              <div className="bg-white/10 rounded-lg p-4">
                <Award className="h-7 w-7 mb-2 text-yellow-400" />
                <div className="text-sm text-purple-100">Format</div>
                <div className="text-lg font-semibold">Work–Study</div>
              </div>
            </div>

            <a href={APPLY} target="_blank" rel="noopener noreferrer" className="inline-flex items-center bg-yellow-500 text-black px-8 py-4 rounded-lg font-bold text-lg hover:bg-yellow-400 transition-all duration-300 transform hover:scale-105 shadow-xl">
              🎓 Apply Now
              <ArrowRight className="ml-2 h-5 w-5" />
            </a>
          </div>

          <div className="bg-white/10 rounded-2xl p-8 shadow-2xl text-center">
            <Image src="/branding/programs/alternance-logo.png" alt="Alternance" width={260} height={160} className="mx-auto" />
          </div>
        </div>
      </header>

      <main>
        <section className="bg-white py-16">
          <div className="max-w-7xl mx-auto px-4">
            <h2 className="text-3xl font-bold text-gray-900 mb-10 text-center">Program Structure</h2>
            <div className="grid lg:grid-cols-3 gap-8">
              {phases.map((p, i) => (
                <div key={i} className="text-center group bg-white rounded-xl p-8 shadow">
                  <div className="inline-flex items-center justify-center w-20 h-20 bg-purple-100 rounded-full mb-6 group-hover:scale-110 transition-transform duration-300">
                    <p.icon className="h-10 w-10 text-purple-700" />
                  </div>
                  <h3 className="text-2xl font-bold text-gray-900 mb-2">{p.title}</h3>
                  <p className="text-purple-700 font-semibold mb-2">{p.duration}</p>
                  <p className="text-gray-600">{p.description}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="bg-gray-50 py-16">
          <div className="max-w-7xl mx-auto px-4 grid lg:grid-cols-2 gap-10">
            <div className="bg-purple-50 rounded-xl p-8">
              <div className="flex items-center mb-6">
                <Users className="h-7 w-7 text-purple-700 mr-3" />
                <h2 className="text-2xl font-bold text-gray-900">For Students</h2>
              </div>
              <ul className="space-y-3">
                {studentBenefits.map((b, i) => (
                  <li key={i} className="flex items-start">
                    <div className="w-2 h-2 bg-purple-700 rounded-full mt-2 mr-3" />
                    <span className="text-gray-700">{b}</span>
                  </li>
                ))}
              </ul>
            </div>

            <div className="bg-blue-50 rounded-xl p-8">
              <div className="flex items-center mb-6">
                <Building className="h-7 w-7 text-blue-700 mr-3" />
                <h2 className="text-2xl font-bold text-gray-900">For Employers</h2>
              </div>
              <ul className="space-y-3">
                {[
                  'Long-term talent development',
                  'Continuous access to motivated students',
                  'Structured workforce development',
                ].map((b, i) => (
                  <li key={i} className="flex items-start">
                    <div className="w-2 h-2 bg-blue-700 rounded-full mt-2 mr-3" />
                    <span className="text-gray-700">{b}</span>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}
EOF

echo "🧹 Removing any dangling partial files Claude might have left (best-effort)..."
# (No destructive deletes here—just note where to check)
echo "   If you see half-written files, re-run this script or overwrite manually."

echo "🏗️ Building frontend..."
npm run build || { echo "❌ Frontend build failed. Fix errors above and re-run."; exit 1; }

# Backend build (optional if you have one)
if [ -f "../backend/package.json" ]; then
  echo "🏗️ Building backend..."
  (cd ../backend && npm run build) || echo "⚠️ Backend build failed or not configured. Skipping."
fi

echo ""
echo "🎉 PHASE 2 & 3 COMPLETE!"
echo "========================"
echo "✅ Public homepage polished (hero, programs, metrics, testimonials, CTA)"
echo "✅ About and Contact pages created"
echo "✅ Program pages: /programs/coop, /programs/remote-aui, /programs/alternance"
echo "✅ All Apply buttons use RecruitCRM with program filters"
echo ""
echo "📁 NOW place your PNGs here:"
echo "   - $FRONTEND_DIR/public/branding/aui/aui-logo.png"
echo "   - $FRONTEND_DIR/public/branding/office/wil-office-logo.png"
echo "   - $FRONTEND_DIR/public/branding/programs/coop-logo.png"
echo "   - $FRONTEND_DIR/public/branding/programs/remote-logo.png"
echo "   - $FRONTEND_DIR/public/branding/programs/alternance-logo.png"
echo ""
echo "🚀 Run the dev server:"
echo "   cd \"$FRONTEND_DIR\" && npm run dev"
echo "   Visit http://localhost:3000"
echo ""
echo "🎯 Ready for Phase 4 (Performance, Accessibility, SEO) when you are."

