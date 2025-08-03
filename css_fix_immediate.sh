#!/bin/bash

echo "🔧 IMMEDIATE CSS FIX - Removing Circular Dependency"
echo "=================================================="

cd ~/Desktop/E+E\ Website/wil-aui-platform/frontend

# Kill any running processes
echo "🛑 Stopping all servers..."
lsof -ti:3000 | xargs kill -9 2>/dev/null || true
lsof -ti:3001 | xargs kill -9 2>/dev/null || true
lsof -ti:3002 | xargs kill -9 2>/dev/null || true

echo "🎨 Fixing globals.css circular dependency..."

# Fix the globals.css file to remove circular dependency
cat > src/app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

/* AUI Brand Foundation Styles */

@layer base {
  html {
    font-family: 'Inter', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;
    color: #1A1A1A;
    background-color: #F8F9FA;
  }
  
  body {
    font-family: 'Inter', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;
    color: #1A1A1A;
    background-color: #F8F9FA;
  }
  
  h1, h2, h3, h4, h5, h6 {
    font-family: 'Inter', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;
    color: #003366;
    font-weight: 600;
  }
  
  h1 { 
    font-size: 3.5rem;
    line-height: 1.1;
    font-weight: 700;
  }
  h2 { 
    font-size: 3rem;
    line-height: 1.2;
    font-weight: 600;
  }
  h3 { 
    font-size: 2.25rem;
    line-height: 1.3;
    font-weight: 600;
  }
  h4 { 
    font-size: 1.875rem;
    line-height: 1.4;
    font-weight: 600;
  }
  h5 { 
    font-size: 1.5rem;
    line-height: 1.5;
    font-weight: 600;
  }
  h6 { 
    font-size: 1.125rem;
    line-height: 1.6;
    font-weight: 600;
  }
}

@layer components {
  /* AUI Button Components */
  .btn-primary {
    @apply bg-aui-primary text-white font-semibold py-3 px-6 rounded-lg 
           hover:bg-aui-secondary transition-all duration-200 
           focus:outline-none focus:ring-2 focus:ring-aui-accent focus:ring-offset-2
           shadow-lg hover:shadow-xl;
  }
  
  .btn-secondary {
    @apply bg-white text-aui-primary border-2 border-aui-primary font-semibold py-3 px-6 rounded-lg 
           hover:bg-aui-primary hover:text-white transition-all duration-200
           focus:outline-none focus:ring-2 focus:ring-aui-accent focus:ring-offset-2
           shadow-lg hover:shadow-xl;
  }
  
  .btn-accent {
    @apply bg-aui-accent text-aui-primary font-semibold py-3 px-6 rounded-lg 
           hover:bg-opacity-90 transition-all duration-200
           focus:outline-none focus:ring-2 focus:ring-aui-primary focus:ring-offset-2
           shadow-lg hover:shadow-xl;
  }
  
  .btn-outline-white {
    @apply border-2 border-white text-white font-semibold py-3 px-6 rounded-lg 
           hover:bg-white hover:text-aui-primary transition-all duration-200
           focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2;
  }
  
  /* AUI Card Components */
  .card {
    @apply bg-white rounded-xl shadow-lg hover:shadow-xl 
           transition-shadow duration-300 border border-gray-200;
  }
  
  .card-hero {
    @apply bg-white rounded-2xl shadow-2xl 
           border border-gray-200;
  }
  
  /* AUI Layout Helpers */
  .section-padding {
    @apply py-16 md:py-20 lg:py-24;
  }
  
  .container-padding {
    @apply px-4 md:px-6 lg:px-8;
  }
  
  .gradient-primary {
    background: linear-gradient(135deg, #003366 0%, #0066CC 100%);
  }
  
  .gradient-accent {
    background: linear-gradient(135deg, #FFD700 0%, #FFE55C 100%);
  }
  
  /* AUI Focus States */
  .focus-ring {
    @apply focus:outline-none focus:ring-2 focus:ring-aui-accent focus:ring-offset-2;
  }
  
  /* AUI Animations */
  .animate-on-scroll {
    @apply opacity-0 translate-y-4 transition-all duration-700 ease-out;
  }
  
  .animate-on-scroll.in-view {
    @apply opacity-100 translate-y-0;
  }
}

@layer utilities {
  /* AUI Utility Classes */
  .bg-pattern {
    background-image: url("data:image/svg+xml,%3Csvg width='20' height='20' viewBox='0 0 20 20' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23003366' fill-opacity='0.03' fill-rule='evenodd'%3E%3Ccircle cx='3' cy='3' r='3'/%3E%3Ccircle cx='13' cy='13' r='3'/%3E%3C/g%3E%3C/svg%3E");
  }
  
  .text-gradient-primary {
    background: linear-gradient(135deg, #003366, #0066CC);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }
  
  .border-gradient {
    border-image: linear-gradient(135deg, #003366, #FFD700) 1;
  }
  
  /* Hero text styling */
  .hero-text {
    font-size: 3.5rem;
    line-height: 1.1;
    font-weight: 700;
    color: #003366;
  }
  
  @media (max-width: 768px) {
    .hero-text {
      font-size: 2.5rem;
    }
  }
  
  @media (max-width: 480px) {
    .hero-text {
      font-size: 2rem;
    }
  }
}
EOF

echo "🎨 Updating hero component to use new classes..."

# Fix the hero component to use the new non-circular classes
cat > src/components/HeroSection.tsx << 'EOF'
'use client'
import Image from 'next/image';
import { openApplicationForm } from '@/lib/recruitcrm';

export default function HeroSection() {
  return (
    <section className="relative min-h-screen flex items-center justify-center bg-pattern">
      {/* Background Gradient */}
      <div className="absolute inset-0 gradient-primary opacity-95"></div>
      
      {/* Content */}
      <div className="relative z-10 max-w-7xl mx-auto container-padding text-center text-white">
        <div className="max-w-4xl mx-auto">
          {/* WIL Office Logo */}
          <div className="mb-8 flex justify-center">
            <div className="w-32 h-32 relative">
              <Image
                src="/public_assets/branding/office/wil-office-logo.png"
                alt="Work-Based Learning Office"
                fill
                className="object-contain"
                sizes="(max-width: 768px) 128px, 128px"
              />
            </div>
          </div>

          {/* Main Headline */}
          <h1 className="hero-text mb-6 leading-tight text-white">
            Work-Based Learning
            <br />
            <span className="text-aui-accent">at AUI</span>
          </h1>

          {/* Subtitle */}
          <p className="text-lg md:text-xl mb-8 opacity-90 leading-relaxed max-w-3xl mx-auto">
            Bridge the gap between academic excellence and professional success. 
            Connect with leading companies through our innovative Co-op, Remote@AUI, 
            and Alternance programs designed to launch your career.
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-12">
            <button
              onClick={() => openApplicationForm('coop')}
              className="btn-accent text-lg px-8 py-4"
            >
              Apply Now
            </button>
            <button
              onClick={() => window.location.href = '/programs'}
              className="btn-outline-white text-lg px-8 py-4"
            >
              Explore Programs
            </button>
          </div>

          {/* Key Benefits */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mt-16">
            <div className="text-center">
              <div className="w-16 h-16 bg-aui-accent rounded-full flex items-center justify-center mx-auto mb-4">
                <svg className="w-8 h-8 text-aui-primary" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M6 6V5a3 3 0 013-3h2a3 3 0 013 3v1h2a2 2 0 012 2v3.57A22.952 22.952 0 0110 13a22.95 22.95 0 01-8-1.43V8a2 2 0 012-2h2zm2-1a1 1 0 011-1h2a1 1 0 011 1v1H8V5zm1 5a1 1 0 011-1h.01a1 1 0 110 2H10a1 1 0 01-1-1z" clipRule="evenodd" />
                  <path d="M2 13.692V16a2 2 0 002 2h12a2 2 0 002-2v-2.308A24.974 24.974 0 0110 15c-2.796 0-5.487-.46-8-1.308z" />
                </svg>
              </div>
              <h3 className="text-xl font-semibold mb-2">Real Experience</h3>
              <p className="text-white opacity-80">
                Work with leading companies and gain hands-on professional experience
              </p>
            </div>
            
            <div className="text-center">
              <div className="w-16 h-16 bg-aui-accent rounded-full flex items-center justify-center mx-auto mb-4">
                <svg className="w-8 h-8 text-aui-primary" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3z" />
                  <path d="M6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z" />
                </svg>
              </div>
              <h3 className="text-xl font-semibold mb-2">Career Growth</h3>
              <p className="text-white opacity-80">
                Build your network and accelerate your career development
              </p>
            </div>
            
            <div className="text-center">
              <div className="w-16 h-16 bg-aui-accent rounded-full flex items-center justify-center mx-auto mb-4">
                <svg className="w-8 h-8 text-aui-primary" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zm0 4a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1V8zm8 0a1 1 0 011-1h4a1 1 0 011 1v3a1 1 0 01-1 1h-4a1 1 0 01-1-1V8z" clipRule="evenodd" />
                </svg>
              </div>
              <h3 className="text-xl font-semibold mb-2">Academic Credit</h3>
              <p className="text-white opacity-80">
                Earn academic credit while gaining valuable work experience
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* Scroll Indicator */}
      <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2 text-white animate-bounce">
        <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 14l-7 7m0 0l-7-7m7 7V3" />
        </svg>
      </div>
    </section>
  );
}
EOF

echo "🎨 Updating metrics component..."

# Fix metrics component
cat > src/components/MetricsSection.tsx << 'EOF'
'use client'

export default function MetricsSection() {
  const metrics = [
    {
      number: '245+',
      label: 'Students Placed',
      description: 'Successfully matched with companies'
    },
    {
      number: '45+',
      label: 'Partner Companies',
      description: 'Leading organizations in Morocco'
    },
    {
      number: '89%',
      label: 'Job Offer Rate',
      description: 'Students receiving offers'
    },
    {
      number: '95%',
      label: 'Satisfaction Score',
      description: 'Student program satisfaction'
    }
  ];

  return (
    <section className="section-padding bg-white">
      <div className="max-w-7xl mx-auto container-padding">
        <div className="text-center mb-16">
          <h2 className="text-4xl font-bold text-aui-primary mb-4">
            Our Impact
          </h2>
          <p className="text-lg text-gray-600">
            Real results from our work-based learning programs
          </p>
        </div>

        <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
          {metrics.map((metric, index) => (
            <div
              key={index}
              className="text-center group hover:scale-105 transition-transform duration-300"
            >
              <div className="card p-6 h-full">
                <div className="text-4xl font-bold text-gradient-primary mb-2">
                  {metric.number}
                </div>
                <div className="text-xl font-semibold text-aui-primary mb-2">
                  {metric.label}
                </div>
                <div className="text-sm text-gray-600">
                  {metric.description}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF

echo "🔧 Building with fixed CSS..."

# Clear cache and build
rm -rf .next
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
else
    echo "❌ Build failed!"
    exit 1
fi

echo ""
echo "🎉 CSS FIX COMPLETE!"
echo "==================="
echo ""
echo "✅ ISSUES RESOLVED:"
echo "  🎨 Circular dependency removed"
echo "  🔧 CSS classes fixed"
echo "  📱 Components updated"
echo "  🏗️ Build successful"
echo ""
echo "🚀 START THE SERVERS:"
echo "  npm run dev"
echo ""
echo "🌐 VISIT YOUR SITE:"
echo "  http://localhost:3000"
echo ""
echo "✨ Your AUI-branded homepage is ready!"
