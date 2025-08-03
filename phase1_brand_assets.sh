#!/bin/bash

# Phase 1: Asset Preparation & AUI Branding Setup
# Goal: Create proper folder structure and integrate official AUI branding

echo "🎨 Phase 1: Asset Preparation & AUI Branding Setup"
echo "=================================================="

# Check if we're in the right directory
if [ ! -d "frontend" ] || [ ! -d "backend" ]; then
    echo "❌ Please run this script from the wil-aui-platform root directory"
    exit 1
fi

echo "📁 Creating official AUI brand asset structure..."

# Create comprehensive brand asset folders
mkdir -p public_assets/branding/aui
mkdir -p public_assets/branding/programs
mkdir -p public_assets/branding/office
mkdir -p public_assets/branding/backgrounds
mkdir -p public_assets/favicons
mkdir -p public_assets/documents

# Create .keep files to preserve folder structure in git
touch public_assets/branding/aui/.keep
touch public_assets/branding/programs/.keep
touch public_assets/branding/office/.keep
touch public_assets/branding/backgrounds/.keep
touch public_assets/favicons/.keep
touch public_assets/documents/.keep

echo "📋 Creating asset placement guide..."

# Create comprehensive asset placement guide
cat > ASSET-PLACEMENT-GUIDE.md << 'EOF'
# 🎨 AUI Brand Assets Placement Guide

## 📁 Where to Place Your PNG Logos

### **REQUIRED LOGOS** (You will upload these)

#### **AUI Official Branding**
Place these in: `/public_assets/branding/aui/`
```
📁 /public_assets/branding/aui/
   📄 aui-logo.png              (Main AUI logo for header)
   📄 aui-logo-white.png        (White version for dark backgrounds)
   📄 aui-seal.png              (Official university seal)
   📄 hero-background.png       (Campus background from PPTX)
   📄 pattern-overlay.png       (Brand pattern if available)
```

#### **WIL Office Branding**
Place these in: `/public_assets/branding/office/`
```
📁 /public_assets/branding/office/
   📄 wil-office-logo.png       (Work-based Learning office logo)
   📄 office-team.png           (Office team photo if available)
```

#### **Program Logos**
Place these in: `/public_assets/branding/programs/`
```
📁 /public_assets/branding/programs/
   📄 coop-logo.png             (Co-op program logo)
   📄 remote-logo.png           (Remote@AUI program logo)
   📄 alternance-logo.png       (Alternance program logo)
   📄 bridgeworks-logo.png      (If you add BridgeWorks later)
```

#### **Favicon Assets**
Place these in: `/public_assets/favicons/`
```
📁 /public_assets/favicons/
   📄 favicon.ico               (AUI favicon)
   📄 apple-touch-icon.png      (iOS app icon)
   📄 favicon-32x32.png         (Standard favicon)
   📄 favicon-16x16.png         (Small favicon)
```

## 🎨 File Requirements

### **Image Specifications**
- **Format**: PNG with transparency (recommended)
- **Resolution**: High-res (minimum 512px width for logos)
- **Background**: Transparent where possible
- **Quality**: Professional/print quality

### **Naming Convention**
- Use lowercase with hyphens: `aui-logo.png`
- Be descriptive: `coop-program-logo.png`
- Include variants: `aui-logo-white.png` for dark backgrounds

## ⚠️ IMPORTANT: Upload Assets BEFORE Phase 2

**You MUST upload all PNG files to the correct folders before running Phase 2.**

Phase 2 will integrate these assets into the website design. If assets are missing, placeholders will be used.

## 📋 Asset Checklist

Before proceeding to Phase 2, verify you have:

- [ ] AUI main logo (for header)
- [ ] WIL office logo
- [ ] Co-op program logo
- [ ] Remote@AUI program logo
- [ ] Alternance program logo
- [ ] Hero background image (optional)
- [ ] Favicon files

## 🔄 Next Steps

1. **Upload all PNG files** to the folders above
2. **Run Phase 2** to integrate AUI branding into Tailwind config
3. **Continue with homepage redesign** using official assets

---

*Asset placement guide created by Phase 1*
EOF

echo "🎨 Setting up AUI color palette in Tailwind config..."

cd frontend

# Update Tailwind config with official AUI brand colors
cat > tailwind.config.js << 'EOF'
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
EOF

echo "🎨 Updating global CSS with AUI brand styles..."

# Update global CSS with AUI brand foundation
cat > src/app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

/* AUI Brand Foundation Styles */

@layer base {
  html {
    font-family: theme('fontFamily.body');
    color: theme('colors.brand.text.primary');
    background-color: theme('colors.brand.bg');
  }
  
  body {
    @apply font-body text-brand-text-primary bg-brand-bg;
  }
  
  h1, h2, h3, h4, h5, h6 {
    font-family: theme('fontFamily.heading');
    color: theme('colors.aui.primary');
    font-weight: 600;
  }
  
  h1 { @apply text-hero; }
  h2 { @apply text-heading-xl; }
  h3 { @apply text-heading-lg; }
  h4 { @apply text-heading-md; }
  h5 { @apply text-heading-sm; }
  h6 { @apply text-body-lg font-semibold; }
}

@layer components {
  /* AUI Button Components */
  .btn-primary {
    @apply bg-aui-primary text-white font-semibold py-3 px-6 rounded-lg 
           hover:bg-aui-secondary transition-all duration-200 
           focus:outline-none focus:ring-2 focus:ring-aui-accent focus:ring-offset-2
           shadow-card hover:shadow-card-hover;
  }
  
  .btn-secondary {
    @apply bg-white text-aui-primary border-2 border-aui-primary font-semibold py-3 px-6 rounded-lg 
           hover:bg-aui-primary hover:text-white transition-all duration-200
           focus:outline-none focus:ring-2 focus:ring-aui-accent focus:ring-offset-2
           shadow-card hover:shadow-card-hover;
  }
  
  .btn-accent {
    @apply bg-aui-accent text-aui-primary font-semibold py-3 px-6 rounded-lg 
           hover:bg-opacity-90 transition-all duration-200
           focus:outline-none focus:ring-2 focus:ring-aui-primary focus:ring-offset-2
           shadow-card hover:shadow-card-hover;
  }
  
  .btn-outline-white {
    @apply border-2 border-white text-white font-semibold py-3 px-6 rounded-lg 
           hover:bg-white hover:text-aui-primary transition-all duration-200
           focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2;
  }
  
  /* AUI Card Components */
  .card {
    @apply bg-brand-surface rounded-xl shadow-card hover:shadow-card-hover 
           transition-shadow duration-300 border border-aui-gray-200;
  }
  
  .card-hero {
    @apply bg-brand-surface rounded-2xl shadow-hero 
           border border-aui-gray-200;
  }
  
  /* AUI Text Styles */
  .text-hero {
    @apply text-hero text-aui-primary font-heading;
  }
  
  .text-subtitle {
    @apply text-body-lg text-brand-text-secondary;
  }
  
  .text-caption {
    @apply text-caption text-brand-text-light;
  }
  
  /* AUI Layout Helpers */
  .section-padding {
    @apply py-16 md:py-20 lg:py-24;
  }
  
  .container-padding {
    @apply px-4 md:px-6 lg:px-8;
  }
  
  .gradient-primary {
    background: linear-gradient(135deg, theme('colors.aui.primary') 0%, theme('colors.aui.secondary') 100%);
  }
  
  .gradient-accent {
    background: linear-gradient(135deg, theme('colors.aui.accent') 0%, #FFE55C 100%);
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
    background: linear-gradient(135deg, theme('colors.aui.primary'), theme('colors.aui.secondary'));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }
  
  .border-gradient {
    border-image: linear-gradient(135deg, theme('colors.aui.primary'), theme('colors.aui.accent')) 1;
  }
}
EOF

echo "📋 Updating .gitignore for brand assets..."

# Update .gitignore to handle brand assets properly
cat >> .gitignore << 'EOF'

# Brand Assets
# Keep only specific image formats in public_assets
public_assets/**/*
!public_assets/**/*.png
!public_assets/**/*.jpg
!public_assets/**/*.jpeg
!public_assets/**/*.svg
!public_assets/**/*.webp
!public_assets/**/*.ico
!public_assets/**/.keep
EOF

echo "📁 Creating asset optimization script..."

cd ..

# Create image optimization script for future use
cat > scripts/optimize-assets.js << 'EOF'
const fs = require('fs');
const path = require('path');

// Asset optimization script for AUI brand assets
// This will be enhanced in later phases with Sharp for image optimization

const ASSET_PATHS = {
  aui: './public_assets/branding/aui/',
  programs: './public_assets/branding/programs/',
  office: './public_assets/branding/office/',
  favicons: './public_assets/favicons/'
};

function checkAssets() {
  console.log('🎨 Checking AUI Brand Assets...');
  
  Object.entries(ASSET_PATHS).forEach(([category, assetPath]) => {
    if (fs.existsSync(assetPath)) {
      const files = fs.readdirSync(assetPath).filter(file => 
        file.endsWith('.png') || file.endsWith('.jpg') || file.endsWith('.svg')
      );
      
      if (files.length > 0) {
        console.log(`✅ ${category}: ${files.length} assets found`);
        files.forEach(file => console.log(`   📄 ${file}`));
      } else {
        console.log(`⚠️  ${category}: No assets found - add PNG/SVG files`);
      }
    } else {
      console.log(`❌ ${category}: Directory not found`);
    }
  });
}

if (require.main === module) {
  checkAssets();
}

module.exports = { checkAssets, ASSET_PATHS };
EOF

# Make script executable
chmod +x scripts/optimize-assets.js

echo "📊 Creating brand implementation documentation..."

# Create brand implementation guide
cat > docs/BRAND-IMPLEMENTATION.md << 'EOF'
# 🎨 AUI Brand Implementation Guide

## Overview

This document outlines how AUI's official branding has been implemented in the WIL.AUI.MA website.

## Brand Colors

### Primary Palette
- **AUI Primary Blue**: `#003366` - Main brand color for headers, buttons, key elements
- **AUI Secondary Blue**: `#0066CC` - Hover states, secondary elements
- **AUI Gold**: `#FFD700` - Accent color, highlights, call-to-action elements
- **AUI Green**: `#228B22` - Success states, growth indicators

### Usage Guidelines
- **Primary Blue**: Use for main navigation, headings, primary buttons
- **Secondary Blue**: Use for hover states, secondary actions
- **Gold**: Use sparingly for accents, key CTAs, highlights
- **Green**: Use for success messages, metrics, positive indicators

## Typography

### Font Stack
- **Heading Font**: Inter (weights: 400, 500, 600, 700)
- **Body Font**: Inter (weights: 400, 500, 600)
- **Fallback**: system-ui, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Arial, sans-serif

### Type Scale
- **Hero**: 56px (3.5rem) - For main homepage hero
- **Heading XL**: 48px (3rem) - For section headings
- **Heading LG**: 36px (2.25rem) - For subsection headings
- **Heading MD**: 30px (1.875rem) - For card titles
- **Heading SM**: 24px (1.5rem) - For smaller headings
- **Body LG**: 18px (1.125rem) - For large body text
- **Body**: 16px (1rem) - For standard body text
- **Body SM**: 14px (0.875rem) - For small text
- **Caption**: 12px (0.75rem) - For captions and metadata

## Component Styles

### Buttons
- **Primary**: Blue background, white text, hover to secondary blue
- **Secondary**: White background, blue border/text, hover to filled
- **Accent**: Gold background, blue text, subtle hover effect

### Cards
- **Standard**: White background, subtle shadow, rounded corners
- **Hero**: Larger shadow, more prominent border radius
- **Hover**: Elevated shadow on hover

### Layout
- **Container**: Max-width with responsive padding
- **Section**: Consistent vertical spacing (py-16 to py-24)
- **Grid**: Responsive grid system using CSS Grid/Flexbox

## Asset Integration

### Logo Usage
- **Header**: AUI logo, left-aligned, appropriate size
- **Programs**: Individual program logos in cards and detail pages
- **Footer**: Combined AUI and WIL office logos

### Image Requirements
- **Format**: PNG with transparency preferred
- **Resolution**: Minimum 512px width for logos
- **Optimization**: WebP variants for performance

## Accessibility

### Color Contrast
- All color combinations meet WCAG AA standards
- Text on backgrounds maintains 4.5:1 contrast ratio minimum

### Focus States
- Visible focus indicators using AUI accent color
- Keyboard navigation support for all interactive elements

## Implementation Notes

### Tailwind Configuration
- Brand colors defined in `tailwind.config.js`
- Custom component classes in `globals.css`
- Utility classes for common brand patterns

### Asset Organization
```
/public_assets/branding/
  ├── aui/           # AUI official logos and graphics
  ├── programs/      # Program-specific logos
  ├── office/        # WIL office branding
  └── favicons/      # Site icons and favicons
```

## Maintenance

### Adding New Assets
1. Place new assets in appropriate `/public_assets/branding/` folder
2. Use consistent naming: `descriptive-name.png`
3. Optimize images before deployment
4. Update this documentation with new assets

### Color Updates
1. Update colors in `tailwind.config.js`
2. Test all components for proper color application
3. Verify accessibility standards are maintained

### Typography Changes
1. Update font definitions in `tailwind.config.js`
2. Test responsive typography across all screen sizes
3. Ensure readability and brand consistency

---

*Brand implementation completed in Phase 1*
*Last updated: $(date)*
EOF

echo ""
echo "🎉 PHASE 1: BRAND SETUP COMPLETE!"
echo "=================================="
echo ""
echo "✅ FOLDER STRUCTURE CREATED:"
echo "  📁 /public_assets/branding/aui/ (for AUI logos)"
echo "  📁 /public_assets/branding/programs/ (for program logos)"
echo "  📁 /public_assets/branding/office/ (for WIL office logo)"
echo "  📁 /public_assets/favicons/ (for site icons)"
echo ""
echo "✅ AUI BRAND INTEGRATION:"
echo "  🎨 Official color palette applied to Tailwind"
echo "  📝 AUI typography system implemented"
echo "  🧩 Brand component classes created"
echo "  📋 Brand implementation guide generated"
echo ""
echo "⚠️  REQUIRED ACTION BEFORE PHASE 2:"
echo "  📄 Upload all PNG logos to the correct folders"
echo "  📋 See ASSET-PLACEMENT-GUIDE.md for exact placement"
echo ""
echo "📁 CURRENT FOLDER STRUCTURE:"
tree public_assets/ 2>/dev/null || ls -la public_assets/
echo ""
echo "🔄 NEXT STEPS:"
echo "  1. Upload your PNG logos to the folders above"
echo "  2. Run Phase 2 to redesign homepage with AUI branding"
echo "  3. Continue with program pages and final polish"
echo ""
echo "📋 CHECK ASSETS: node scripts/optimize-assets.js"
echo ""
echo "🎯 Phase 1 Status: COMPLETE - Ready for logo upload!"
