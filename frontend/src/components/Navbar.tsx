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
