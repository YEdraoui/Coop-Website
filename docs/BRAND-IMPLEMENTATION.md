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
