/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        // Official AUI Brand Colors (from DevCom chart)
        aui: {
          primary: '#003366',      // Deep AUI Blue (main brand color)
          secondary: '#0066CC',    // Lighter AUI Blue
          accent: '#FFD700',       // AUI Gold (accent color)
          green: '#228B22',        // AUI Green (success/growth)
          light: '#F8F9FA',        // Light background
          dark: '#1A1A1A',         // Dark text
          gray: {
            50: '#F9FAFB',
            100: '#F3F4F6',
            200: '#E5E7EB',
            300: '#D1D5DB',
            400: '#9CA3AF',
            500: '#6B7280',
            600: '#4B5563',
            700: '#374151',
            800: '#1F2937',
            900: '#111827',
          }
        },
        // Brand semantic colors
        brand: {
          primary: '#003366',      // AUI Primary Blue
          secondary: '#0066CC',    // AUI Secondary Blue
          accent: '#FFD700',       // AUI Gold
          success: '#228B22',      // AUI Green
          warning: '#FFA500',      // Orange for warnings
          error: '#DC2626',        // Red for errors
          bg: '#F8F9FA',          // Default page background
          surface: '#FFFFFF',      // Card/surface background
          text: {
            primary: '#1A1A1A',    // Primary text
            secondary: '#4B5563',  // Secondary text
            light: '#6B7280',      // Light text
            white: '#FFFFFF',      // White text for dark backgrounds
          }
        }
      },
      fontFamily: {
        // AUI Typography (from brand guidelines)
        heading: ['Inter', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Arial', 'sans-serif'],
        body: ['Inter', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Arial', 'sans-serif'],
        mono: ['SF Mono', 'Monaco', 'Consolas', 'Liberation Mono', 'Courier New', 'monospace'],
      },
      fontSize: {
        // AUI Typography Scale
        'hero': ['3.5rem', { lineHeight: '1.1', fontWeight: '700' }],      // 56px
        'heading-xl': ['3rem', { lineHeight: '1.2', fontWeight: '600' }],   // 48px
        'heading-lg': ['2.25rem', { lineHeight: '1.3', fontWeight: '600' }], // 36px
        'heading-md': ['1.875rem', { lineHeight: '1.4', fontWeight: '600' }], // 30px
        'heading-sm': ['1.5rem', { lineHeight: '1.5', fontWeight: '600' }],   // 24px
        'body-lg': ['1.125rem', { lineHeight: '1.6', fontWeight: '400' }],    // 18px
        'body': ['1rem', { lineHeight: '1.6', fontWeight: '400' }],           // 16px
        'body-sm': ['0.875rem', { lineHeight: '1.5', fontWeight: '400' }],    // 14px
        'caption': ['0.75rem', { lineHeight: '1.4', fontWeight: '400' }],     // 12px
      },
      spacing: {
        // AUI Spacing Scale
        '18': '4.5rem',   // 72px
        '22': '5.5rem',   // 88px
        '26': '6.5rem',   // 104px
        '30': '7.5rem',   // 120px
        '34': '8.5rem',   // 136px
        '38': '9.5rem',   // 152px
      },
      borderRadius: {
        // AUI Border Radius
        'none': '0',
        'sm': '0.25rem',    // 4px
        'md': '0.5rem',     // 8px
        'lg': '1rem',       // 16px
        'xl': '1.25rem',    // 20px
        '2xl': '1.5rem',    // 24px
        '3xl': '2rem',      // 32px
        'full': '9999px',
      },
      boxShadow: {
        // AUI Shadows
        'card': '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
        'card-hover': '0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)',
        'hero': '0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05)',
      },
      animation: {
        // AUI Animations
        'fade-in': 'fadeIn 0.6s ease-out',
        'slide-up': 'slideUp 0.6s ease-out',
        'scale-in': 'scaleIn 0.3s ease-out',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { opacity: '0', transform: 'translateY(20px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        scaleIn: {
          '0%': { opacity: '0', transform: 'scale(0.95)' },
          '100%': { opacity: '1', transform: 'scale(1)' },
        },
      },
    },
  },
  plugins: [],
}
