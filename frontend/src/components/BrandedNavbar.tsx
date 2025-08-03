'use client'
import { useState } from 'react';
import Image from 'next/image';
import Link from 'next/link';
import { openApplicationForm } from '@/lib/recruitcrm';

export default function BrandedNavbar() {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <nav className="bg-white shadow-lg fixed w-full top-0 z-50">
      <div className="max-w-7xl mx-auto container-padding">
        <div className="flex justify-between items-center h-20">
          {/* AUI Logo */}
          <div className="flex items-center">
            <Link href="/" className="flex items-center space-x-3">
              <div className="relative h-16 w-48">
                <Image
                  src="/branding/aui/aui-logo.png"
                  alt="Al Akhawayn University"
                  fill
                  className="object-contain object-left"
                  priority
                  sizes="(max-width: 768px) 150px, 200px"
                />
              </div>
            </Link>
          </div>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center space-x-8">
            <Link 
              href="/" 
              className="text-aui-gray-700 hover:text-aui-primary transition-colors font-medium text-lg"
            >
              Home
            </Link>
            <Link 
              href="/programs" 
              className="text-aui-gray-700 hover:text-aui-primary transition-colors font-medium text-lg"
            >
              Programs
            </Link>
            <Link 
              href="/about" 
              className="text-aui-gray-700 hover:text-aui-primary transition-colors font-medium text-lg"
            >
              About WIL
            </Link>
            <Link 
              href="/contact" 
              className="text-aui-gray-700 hover:text-aui-primary transition-colors font-medium text-lg"
            >
              Contact
            </Link>
            
            {/* Primary CTA */}
            <button
              onClick={() => openApplicationForm('coop')}
              className="btn-primary text-lg px-8 py-3"
            >
              Apply Now
            </button>
          </div>

          {/* Mobile menu button */}
          <div className="md:hidden">
            <button
              onClick={() => setIsOpen(!isOpen)}
              className="text-aui-gray-700 hover:text-aui-primary focus:outline-none focus:text-aui-primary transition-colors"
            >
              <svg className="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                {isOpen ? (
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                ) : (
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
                )}
              </svg>
            </button>
          </div>
        </div>

        {/* Mobile Navigation */}
        {isOpen && (
          <div className="md:hidden">
            <div className="px-2 pt-2 pb-3 space-y-1 bg-white border-t border-aui-gray-200">
              <Link
                href="/"
                className="block px-4 py-3 text-aui-gray-700 hover:text-aui-primary hover:bg-aui-light rounded-md font-medium"
                onClick={() => setIsOpen(false)}
              >
                Home
              </Link>
              <Link
                href="/programs"
                className="block px-4 py-3 text-aui-gray-700 hover:text-aui-primary hover:bg-aui-light rounded-md font-medium"
                onClick={() => setIsOpen(false)}
              >
                Programs
              </Link>
              <Link
                href="/about"
                className="block px-4 py-3 text-aui-gray-700 hover:text-aui-primary hover:bg-aui-light rounded-md font-medium"
                onClick={() => setIsOpen(false)}
              >
                About WIL
              </Link>
              <Link
                href="/contact"
                className="block px-4 py-3 text-aui-gray-700 hover:text-aui-primary hover:bg-aui-light rounded-md font-medium"
                onClick={() => setIsOpen(false)}
              >
                Contact
              </Link>
              
              <div className="px-4 py-3">
                <button
                  onClick={() => {
                    openApplicationForm('coop');
                    setIsOpen(false);
                  }}
                  className="btn-primary w-full"
                >
                  Apply Now
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </nav>
  );
}
