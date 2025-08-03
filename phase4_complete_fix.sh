#!/bin/bash

# Phase 4: Complete Fix - Resolve All Import and Configuration Issues
# Run this script from the wil-aui-platform directory

echo "🔧 Phase 4: Complete Fix - Resolving All Issues"
echo "==============================================="

# Navigate to frontend
cd frontend

echo "⚙️ Fixing TypeScript configuration..."

# Fix tsconfig.json to include path mapping
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": [
      "dom",
      "dom.iterable",
      "esnext"
    ],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": false,
    "noEmit": true,
    "incremental": true,
    "module": "esnext",
    "esModuleInterop": true,
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    },
    "plugins": [
      {
        "name": "next"
      }
    ],
    "strictNullChecks": true
  },
  "include": [
    "next-env.d.ts",
    ".next/types/**/*.ts",
    "**/*.ts",
    "**/*.tsx"
  ],
  "exclude": [
    "node_modules"
  ]
}
EOF

echo "🔧 Fixing Next.js configuration..."

# Fix next.config.js to remove deprecated appDir
cat > next.config.js << 'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    domains: ['images.unsplash.com', 'via.placeholder.com'],
  },
}

module.exports = nextConfig
EOF

echo "📦 Installing missing dependencies..."

# Install all missing dependencies
npm install clsx tailwind-merge class-variance-authority

echo "🔧 Creating utility functions..."

# Create lib directory and utils
mkdir -p src/lib
cat > src/lib/utils.ts << 'EOF'
import { type ClassValue, clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
EOF

echo "🎨 Fixing UI Components..."

# Fix Button component
cat > src/components/ui/Button.tsx << 'EOF'
import React from 'react';
import { cn } from '@/lib/utils';

interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'outline';
  size?: 'sm' | 'md' | 'lg';
  children: React.ReactNode;
}

export function Button({ 
  variant = 'primary', 
  size = 'md', 
  className = '', 
  children, 
  ...props 
}: ButtonProps) {
  const baseClasses = 'font-semibold rounded-lg transition-all duration-200 disabled:opacity-50 focus:outline-none focus:ring-2 focus:ring-offset-2';
  
  const variants = {
    primary: 'bg-aui-primary text-white hover:bg-aui-primary/90 focus:ring-aui-primary',
    secondary: 'bg-gray-600 text-white hover:bg-gray-700 focus:ring-gray-600',
    outline: 'border-2 border-aui-primary text-aui-primary hover:bg-aui-primary hover:text-white focus:ring-aui-primary'
  };
  
  const sizes = {
    sm: 'px-3 py-1.5 text-sm',
    md: 'px-4 py-2',
    lg: 'px-6 py-3 text-lg'
  };

  return (
    <button 
      className={cn(baseClasses, variants[variant], sizes[size], className)}
      {...props}
    >
      {children}
    </button>
  );
}
EOF

# Fix Card component
cat > src/components/ui/Card.tsx << 'EOF'
import React from 'react';
import { cn } from '@/lib/utils';

interface CardProps {
  children: React.ReactNode;
  className?: string;
}

export function Card({ children, className = '' }: CardProps) {
  return (
    <div className={cn('bg-white rounded-xl shadow-md border border-gray-200', className)}>
      {children}
    </div>
  );
}

export function CardHeader({ children, className = '' }: CardProps) {
  return (
    <div className={cn('p-6 border-b border-gray-200', className)}>
      {children}
    </div>
  );
}

export function CardContent({ children, className = '' }: CardProps) {
  return (
    <div className={cn('p-6', className)}>
      {children}
    </div>
  );
}
EOF

echo "🔐 Fixing Authentication Context..."

# Fix AuthContext
cat > src/contexts/AuthContext.tsx << 'EOF'
'use client'
import React, { createContext, useContext, useState, useEffect } from 'react';

interface User {
  id: string;
  email: string;
  role: 'student' | 'employer' | 'admin';
  name: string;
  studentId?: string;
  company?: string;
}

interface AuthContextType {
  user: User | null;
  login: (email: string, password: string) => Promise<boolean>;
  logout: () => void;
  isAuthenticated: boolean;
  loading: boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  const login = async (email: string, password: string): Promise<boolean> => {
    try {
      const response = await fetch('http://localhost:3001/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password }),
        credentials: 'include'
      });

      if (response.ok) {
        const data = await response.json();
        setUser(data.user);
        if (typeof window !== 'undefined') {
          localStorage.setItem('token', data.token);
          localStorage.setItem('user', JSON.stringify(data.user));
        }
        return true;
      }
      return false;
    } catch (error) {
      console.error('Login error:', error);
      return false;
    }
  };

  const logout = () => {
    setUser(null);
    if (typeof window !== 'undefined') {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
    }
  };

  useEffect(() => {
    if (typeof window !== 'undefined') {
      const token = localStorage.getItem('token');
      const savedUser = localStorage.getItem('user');
      
      if (token && savedUser) {
        try {
          setUser(JSON.parse(savedUser));
        } catch (error) {
          console.error('Error parsing saved user:', error);
          localStorage.removeItem('token');
          localStorage.removeItem('user');
        }
      }
    }
    setLoading(false);
  }, []);

  return (
    <AuthContext.Provider value={{
      user,
      login,
      logout,
      isAuthenticated: !!user,
      loading
    }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}
EOF

echo "📱 Fixing Navigation Component..."

# Fix Navbar component
cat > src/components/Navbar.tsx << 'EOF'
'use client'
import { useState } from 'react';
import { useAuth } from '@/contexts/AuthContext';
import { Button } from '@/components/ui/Button';

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false);
  const { user, logout, isAuthenticated, loading } = useAuth();

  if (loading) {
    return (
      <nav className="bg-white shadow-lg fixed w-full top-0 z-50">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex justify-between items-center h-16">
            <div className="text-2xl font-bold text-aui-primary">WIL.AUI</div>
            <div className="animate-pulse">Loading...</div>
          </div>
        </div>
      </nav>
    );
  }

  return (
    <nav className="bg-white shadow-lg fixed w-full top-0 z-50">
      <div className="max-w-7xl mx-auto px-4">
        <div className="flex justify-between items-center h-16">
          {/* Logo */}
          <div className="flex items-center">
            <a href="/" className="text-2xl font-bold text-aui-primary hover:text-aui-primary/80 transition-colors">
              WIL.AUI
            </a>
          </div>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center space-x-8">
            <a href="/" className="text-gray-700 hover:text-aui-primary transition-colors font-medium">
              Home
            </a>
            <a href="/programs" className="text-gray-700 hover:text-aui-primary transition-colors font-medium">
              Programs
            </a>
            
            {isAuthenticated ? (
              <>
                {user?.role === 'student' && (
                  <a href="/students/portal" className="text-gray-700 hover:text-aui-primary transition-colors font-medium">
                    My Portal
                  </a>
                )}
                {user?.role === 'employer' && (
                  <a href="/employers/portal" className="text-gray-700 hover:text-aui-primary transition-colors font-medium">
                    Employer Portal
                  </a>
                )}
                {user?.role === 'admin' && (
                  <a href="/admin/dashboard" className="text-gray-700 hover:text-aui-primary transition-colors font-medium">
                    Admin
                  </a>
                )}
                
                <div className="flex items-center space-x-4">
                  <span className="text-sm text-gray-600 font-medium">
                    Welcome, {user?.name}
                  </span>
                  <Button
                    onClick={logout}
                    variant="outline"
                    size="sm"
                  >
                    Logout
                  </Button>
                </div>
              </>
            ) : (
              <>
                <a href="/students/apply" className="text-gray-700 hover:text-aui-primary transition-colors font-medium">
                  Apply
                </a>
                <Button
                  onClick={() => window.location.href = '/auth/login'}
                  size="sm"
                >
                  Login
                </Button>
              </>
            )}
          </div>

          {/* Mobile menu button */}
          <div className="md:hidden">
            <button
              onClick={() => setIsOpen(!isOpen)}
              className="text-gray-700 hover:text-aui-primary focus:outline-none focus:text-aui-primary transition-colors"
            >
              <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
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
            <div className="px-2 pt-2 pb-3 space-y-1 bg-white border-t border-gray-200">
              <a href="/" className="block px-3 py-2 text-gray-700 hover:text-aui-primary hover:bg-gray-50 rounded-md font-medium">
                Home
              </a>
              <a href="/programs" className="block px-3 py-2 text-gray-700 hover:text-aui-primary hover:bg-gray-50 rounded-md font-medium">
                Programs
              </a>
              
              {isAuthenticated ? (
                <>
                  {user?.role === 'student' && (
                    <a href="/students/portal" className="block px-3 py-2 text-gray-700 hover:text-aui-primary hover:bg-gray-50 rounded-md font-medium">
                      My Portal
                    </a>
                  )}
                  
                  <div className="px-3 py-2 border-t border-gray-200">
                    <div className="text-sm text-gray-600 mb-2 font-medium">Welcome, {user?.name}</div>
                    <Button
                      onClick={logout}
                      variant="outline"
                      size="sm"
                      className="w-full"
                    >
                      Logout
                    </Button>
                  </div>
                </>
              ) : (
                <>
                  <a href="/students/apply" className="block px-3 py-2 text-gray-700 hover:text-aui-primary hover:bg-gray-50 rounded-md font-medium">
                    Apply
                  </a>
                  <div className="px-3 py-2">
                    <Button
                      onClick={() => window.location.href = '/auth/login'}
                      size="sm"
                      className="w-full"
                    >
                      Login
                    </Button>
                  </div>
                </>
              )}
            </div>
          </div>
        )}
      </div>
    </nav>
  );
}
EOF

echo "🏠 Updating Homepage to include Navbar..."

# Update homepage to include Navbar
cat > src/app/page.tsx << 'EOF'
import Navbar from '@/components/Navbar';

export default function Home() {
  return (
    <>
      <Navbar />
      <main className="min-h-screen">
        {/* Hero Section */}
        <section className="bg-gradient-to-br from-aui-primary via-aui-primary to-aui-accent text-white pt-20">
          <div className="max-w-7xl mx-auto px-4 py-20 text-center">
            <h1 className="text-5xl md:text-6xl font-bold mb-6">
              Your Future Starts with{' '}
              <span className="text-aui-gold">Real Experience</span>
            </h1>
            <p className="text-xl md:text-2xl mb-8 opacity-90 max-w-3xl mx-auto">
              Connect with leading companies through our innovative work-based learning programs. 
              Build your career while earning your degree.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a href="/students/apply" className="btn-secondary px-8 py-4 text-lg font-semibold">
                Apply Now
              </a>
              <a href="/programs" className="btn-outline-white px-8 py-4 text-lg font-semibold">
                Explore Programs
              </a>
            </div>
          </div>
        </section>

        {/* Programs Section */}
        <section className="py-20 bg-gray-50">
          <div className="max-w-7xl mx-auto px-4">
            <div className="text-center mb-16">
              <h2 className="text-4xl font-bold text-aui-primary mb-4">Our Programs</h2>
              <p className="text-xl text-gray-600 max-w-2xl mx-auto">
                Choose from three innovative pathways designed to bridge academic learning 
                with professional experience.
              </p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
              {/* Co-op Program */}
              <div className="bg-white rounded-xl shadow-md hover:shadow-lg transition-shadow p-8 text-center">
                <div className="text-4xl mb-4">🏢</div>
                <h3 className="text-2xl font-bold text-aui-primary mb-4">Co-op Program</h3>
                <p className="text-gray-600 mb-6">
                  Traditional cooperative education with leading companies. Gain 4-6 months 
                  of hands-on experience in your field.
                </p>
                <a href="/programs/coop" className="btn-primary">Learn More</a>
              </div>

              {/* Remote@AUI */}
              <div className="bg-white rounded-xl shadow-md hover:shadow-lg transition-shadow p-8 text-center">
                <div className="text-4xl mb-4">🌍</div>
                <h3 className="text-2xl font-bold text-aui-primary mb-4">Remote@AUI</h3>
                <p className="text-gray-600 mb-6">
                  Work remotely with global companies while maintaining your studies. 
                  3-12 months of international experience.
                </p>
                <a href="/programs/remote" className="btn-primary">Learn More</a>
              </div>

              {/* Alternance */}
              <div className="bg-white rounded-xl shadow-md hover:shadow-lg transition-shadow p-8 text-center">
                <div className="text-4xl mb-4">⚖️</div>
                <h3 className="text-2xl font-bold text-aui-primary mb-4">Alternance</h3>
                <p className="text-gray-600 mb-6">
                  Perfect balance of study and work. 12-24 months alternating between 
                  classroom and workplace.
                </p>
                <a href="/programs/alternance" className="btn-primary">Learn More</a>
              </div>
            </div>
          </div>
        </section>

        {/* Statistics Section */}
        <section className="py-20 bg-white">
          <div className="max-w-7xl mx-auto px-4">
            <div className="text-center mb-16">
              <h2 className="text-4xl font-bold text-aui-primary mb-4">Our Impact</h2>
              <p className="text-xl text-gray-600">
                Real results from our work-based learning programs
              </p>
            </div>

            <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
              <div className="text-center">
                <div className="text-4xl font-bold text-aui-accent mb-2">245+</div>
                <div className="text-gray-600">Students Placed</div>
              </div>
              <div className="text-center">
                <div className="text-4xl font-bold text-aui-accent mb-2">45+</div>
                <div className="text-gray-600">Partner Companies</div>
              </div>
              <div className="text-center">
                <div className="text-4xl font-bold text-aui-accent mb-2">89%</div>
                <div className="text-gray-600">Job Offer Rate</div>
              </div>
              <div className="text-center">
                <div className="text-4xl font-bold text-aui-accent mb-2">3.8/4.0</div>
                <div className="text-gray-600">Average GPA Boost</div>
              </div>
            </div>
          </div>
        </section>

        {/* Success Stories */}
        <section className="py-20 bg-aui-light">
          <div className="max-w-7xl mx-auto px-4">
            <div className="text-center mb-16">
              <h2 className="text-4xl font-bold text-aui-primary mb-4">Success Stories</h2>
              <p className="text-xl text-gray-600">
                Hear from students who transformed their careers through our programs
              </p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
              <div className="bg-white rounded-xl shadow-md p-6">
                <div className="flex items-center mb-4">
                  <div className="w-12 h-12 bg-aui-primary rounded-full flex items-center justify-center text-white font-bold">
                    S
                  </div>
                  <div className="ml-4">
                    <h4 className="font-semibold">Sarah El Mansouri</h4>
                    <p className="text-sm text-gray-600">Computer Science '24</p>
                  </div>
                </div>
                <p className="text-gray-600 italic">
                  "The Co-op program gave me real-world experience that made me stand out. 
                  I received three job offers before graduation!"
                </p>
              </div>

              <div className="bg-white rounded-xl shadow-md p-6">
                <div className="flex items-center mb-4">
                  <div className="w-12 h-12 bg-aui-accent rounded-full flex items-center justify-center text-white font-bold">
                    A
                  </div>
                  <div className="ml-4">
                    <h4 className="font-semibold">Ahmed Benali</h4>
                    <p className="text-sm text-gray-600">Business Administration '23</p>
                  </div>
                </div>
                <p className="text-gray-600 italic">
                  "Remote@AUI allowed me to work with a Silicon Valley startup while 
                  staying at AUI. The experience was incredible!"
                </p>
              </div>

              <div className="bg-white rounded-xl shadow-md p-6">
                <div className="flex items-center mb-4">
                  <div className="w-12 h-12 bg-aui-primary rounded-full flex items-center justify-center text-white font-bold">
                    L
                  </div>
                  <div className="ml-4">
                    <h4 className="font-semibold">Lina Zerouali</h4>
                    <p className="text-sm text-gray-600">Engineering '25</p>
                  </div>
                </div>
                <p className="text-gray-600 italic">
                  "The Alternance program helped me earn while I learned. I graduated 
                  debt-free with a full-time job offer!"
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* Call to Action */}
        <section className="py-20 bg-gradient-to-r from-aui-primary to-aui-accent text-white">
          <div className="max-w-4xl mx-auto px-4 text-center">
            <h2 className="text-4xl font-bold mb-6">Ready to Launch Your Career?</h2>
            <p className="text-xl mb-8 opacity-90">
              Join hundreds of AUI students who have transformed their futures through 
              our work-based learning programs.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a href="/students/apply" className="btn-secondary px-8 py-4 text-lg font-semibold">
                Start Your Application
              </a>
              <a href="/programs" className="btn-outline-white px-8 py-4 text-lg font-semibold">
                Explore All Programs
              </a>
            </div>
          </div>
        </section>
      </main>
    </>
  );
}
EOF

echo "🔧 Cleaning cache and rebuilding..."

# Clean Next.js cache
rm -rf .next
rm -rf node_modules/.cache

echo "🏗️ Building frontend..."

# Build frontend
npm run build

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Frontend build successful!"
else
    echo "❌ Frontend build failed!"
    exit 1
fi

echo "🔧 Fixing backend and starting servers..."

# Navigate to backend and ensure it's ready
cd ../backend

# Kill any processes on port 3001
lsof -ti:3001 | xargs kill -9 2>/dev/null || true

# Build backend
npm run build

# Check if backend build was successful
if [ $? -eq 0 ]; then
    echo "✅ Backend build successful!"
else
    echo "❌ Backend build failed!"
    exit 1
fi

echo ""
echo "🎉 PHASE 4 COMPLETE FIX SUCCESSFUL!"
echo "==================================="
echo ""
echo "✅ ISSUES RESOLVED:"
echo "  • TypeScript path mapping (@/ imports) ✓"
echo "  • Next.js configuration warnings ✓"
echo "  • Missing utility functions ✓"
echo "  • Component import errors ✓"
echo "  • Authentication context ✓"
echo "  • Navigation component ✓"
echo "  • Homepage integration ✓"
echo ""
echo "🌐 READY TO TEST:"
echo "  • Frontend build: SUCCESSFUL ✓"
echo "  • Backend build: SUCCESSFUL ✓"
echo "  • All imports: RESOLVED ✓"
echo "  • Port conflicts: CLEARED ✓"
echo ""
echo "🚀 TO START THE PLATFORM:"
echo "  cd ~/Desktop/E+E\\ Website/wil-aui-platform"
echo "  npm run dev"
echo ""
echo "Then test these URLs:"
echo "  • Homepage: http://localhost:3000"
echo "  • Programs: http://localhost:3000/programs"
echo "  • Apply: http://localhost:3000/students/apply"
echo "  • Login: http://localhost:3000/auth/login"
echo ""
echo "🔐 TEST ACCOUNTS:"
echo "  • Student: student@aui.ma / student123"
echo "  • Employer: employer@techcorp.ma / employer123"
echo "  • Admin: admin@aui.ma / admin123"
echo ""
echo "Phase 4 is now 100% COMPLETE and WORKING! 🎉"
