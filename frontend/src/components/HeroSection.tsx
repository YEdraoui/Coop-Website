'use client'
import Image from 'next/image';
import { openApplicationForm } from '@/lib/recruitcrm';

export default function HeroSection() {
  return (
    <section className="relative min-h-screen flex items-center justify-center bg-gradient-to-br from-aui-primary via-aui-primary to-aui-secondary">
      {/* Background Pattern Overlay */}
      <div className="absolute inset-0 bg-pattern opacity-10"></div>
      
      {/* Content */}
      <div className="relative z-10 max-w-7xl mx-auto container-padding text-center text-white pt-20">
        <div className="max-w-5xl mx-auto">
          {/* WIL Office Logo */}
          <div className="mb-12 flex justify-center">
            <div className="relative w-40 h-40 md:w-48 md:h-48">
              <Image
                src="/branding/office/wil-office-logo.png"
                alt="Work-Based Learning Office - Al Akhawayn University"
                fill
                className="object-contain drop-shadow-2xl"
                sizes="(max-width: 768px) 160px, 192px"
                priority
              />
            </div>
          </div>

          {/* Main Headline */}
          <h1 className="hero-text mb-8 leading-tight text-white">
            Work-Based Learning
            <br />
            <span className="text-aui-accent drop-shadow-lg">at Al Akhawayn University</span>
          </h1>

          {/* Subtitle */}
          <p className="text-xl md:text-2xl mb-12 opacity-95 leading-relaxed max-w-4xl mx-auto font-light">
            Bridge the gap between academic excellence and professional success. 
            Connect with leading companies through our innovative <strong>Co-op</strong>, <strong>Remote@AUI</strong>, 
            and <strong>Alternance</strong> programs designed to launch your career in Morocco and beyond.
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-6 justify-center mb-16">
            <button
              onClick={() => openApplicationForm('coop')}
              className="btn-accent text-xl px-10 py-4 font-bold shadow-2xl hover:scale-105 transition-all duration-300"
            >
              🚀 Apply Now
            </button>
            <button
              onClick={() => window.location.href = '/programs'}
              className="btn-outline-white text-xl px-10 py-4 font-semibold shadow-lg hover:scale-105 transition-all duration-300"
            >
              📋 Explore Programs
            </button>
          </div>

          {/* Key Benefits Grid */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mt-20">
            <div className="text-center p-6 bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 hover:bg-white/20 transition-all duration-300">
              <div className="w-20 h-20 bg-aui-accent rounded-full flex items-center justify-center mx-auto mb-6 shadow-xl">
                <svg className="w-10 h-10 text-aui-primary" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M6 6V5a3 3 0 013-3h2a3 3 0 013 3v1h2a2 2 0 012 2v3.57A22.952 22.952 0 0110 13a22.95 22.95 0 01-8-1.43V8a2 2 0 012-2h2zm2-1a1 1 0 011-1h2a1 1 0 011 1v1H8V5zm1 5a1 1 0 011-1h.01a1 1 0 110 2H10a1 1 0 01-1-1z" clipRule="evenodd" />
                  <path d="M2 13.692V16a2 2 0 002 2h12a2 2 0 002-2v-2.308A24.974 24.974 0 0110 15c-2.796 0-5.487-.46-8-1.308z" />
                </svg>
              </div>
              <h3 className="text-2xl font-bold mb-4 text-aui-accent">Real Experience</h3>
              <p className="text-white/90 leading-relaxed">
                Work with leading companies across Morocco and internationally. 
                Gain hands-on professional experience that makes you job-ready.
              </p>
            </div>
            
            <div className="text-center p-6 bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 hover:bg-white/20 transition-all duration-300">
              <div className="w-20 h-20 bg-aui-accent rounded-full flex items-center justify-center mx-auto mb-6 shadow-xl">
                <svg className="w-10 h-10 text-aui-primary" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3z" />
                  <path d="M6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z" />
                </svg>
              </div>
              <h3 className="text-2xl font-bold mb-4 text-aui-accent">Career Growth</h3>
              <p className="text-white/90 leading-relaxed">
                Build your professional network and accelerate your career development. 
                89% of our students receive job offers before graduation.
              </p>
            </div>
            
            <div className="text-center p-6 bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 hover:bg-white/20 transition-all duration-300">
              <div className="w-20 h-20 bg-aui-accent rounded-full flex items-center justify-center mx-auto mb-6 shadow-xl">
                <svg className="w-10 h-10 text-aui-primary" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zm0 4a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1V8zm8 0a1 1 0 011-1h4a1 1 0 011 1v3a1 1 0 01-1 1h-4a1 1 0 01-1-1V8z" clipRule="evenodd" />
                </svg>
              </div>
              <h3 className="text-2xl font-bold mb-4 text-aui-accent">Academic Excellence</h3>
              <p className="text-white/90 leading-relaxed">
                Earn academic credit while gaining valuable work experience. 
                Seamlessly integrate learning with professional development.
              </p>
            </div>
          </div>

          {/* Success Stats */}
          <div className="mt-20 grid grid-cols-2 md:grid-cols-4 gap-8">
            <div className="text-center">
              <div className="text-4xl font-bold text-aui-accent mb-2">245+</div>
              <div className="text-white/80">Students Placed</div>
            </div>
            <div className="text-center">
              <div className="text-4xl font-bold text-aui-accent mb-2">45+</div>
              <div className="text-white/80">Partner Companies</div>
            </div>
            <div className="text-center">
              <div className="text-4xl font-bold text-aui-accent mb-2">89%</div>
              <div className="text-white/80">Job Offer Rate</div>
            </div>
            <div className="text-center">
              <div className="text-4xl font-bold text-aui-accent mb-2">95%</div>
              <div className="text-white/80">Satisfaction</div>
            </div>
          </div>
        </div>
      </div>

      {/* Scroll Indicator */}
      <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2 text-aui-accent animate-bounce">
        <svg className="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 14l-7 7m0 0l-7-7m7 7V3" />
        </svg>
      </div>
    </section>
  );
}
