# Phase 1: Complete Planning & Architecture for WIL.AUI.MA
# Run this script inside the wil-aui-platform directory

#!/bin/bash

# Navigate to project directory


# Create detailed sitemap and navigation structure
cat > docs/architecture/sitemap.md << 'EOF'
# WIL.AUI.MA Complete Sitemap & Navigation Architecture

## Primary Navigation Structure
```
wil.aui.ma/
├── Home (/)
├── Programs (/programs)
│   ├── Co-op Program (/programs/coop)
│   ├── Remote@AUI (/programs/remote)
│   └── Alternance (/programs/alternance)
├── For Students (/students)
│   ├── How to Apply (/students/apply)
│   ├── Student Portal (/students/portal) [AUTH]
│   └── Success Stories (/students/stories)
├── For Employers (/employers)
│   ├── Partner With Us (/employers/partnership)
│   ├── Post Opportunities (/employers/post) [AUTH]
│   └── Employer Portal (/employers/portal) [AUTH]
├── Impact & Results (/impact)
├── Resources (/resources)
│   ├── Downloads (/resources/downloads)
│   ├── FAQ (/resources/faq)
│   └── Contact (/resources/contact)
└── Admin Panel (/admin) [ADMIN ONLY]
```

## Secondary/Utility Pages
- Login/Register (/auth/login, /auth/register)
- Password Reset (/auth/reset)
- Terms & Privacy (/legal/terms, /legal/privacy)
- 404 Error (/404)

## Mobile Navigation Priority
1. Programs (dropdown)
2. Students
3. Employers
4. Login/Portal
EOF

# Create comprehensive user roles and permissions matrix
cat > docs/architecture/user-roles.md << 'EOF'
# User Roles & Permissions Matrix

## Role Definitions

### 1. Anonymous User (Public)
**Access Level**: Public pages only
**Permissions**:
- ✅ View all public content (home, programs, impact, resources)
- ✅ Browse success stories and testimonials
- ✅ Download public resources (brochures, forms)
- ✅ Contact forms and inquiries
- ❌ Cannot access portals or apply

### 2. Student User
**Access Level**: Student-specific features
**Authentication**: Required for portal access
**Permissions**:
- ✅ All Anonymous User permissions
- ✅ Create and submit program applications
- ✅ Access Student Portal dashboard
- ✅ Track application status
- ✅ Upload documents and portfolios
- ✅ View personalized recommendations
- ✅ Access student-only resources
- ❌ Cannot access employer or admin features

### 3. Employer User
**Access Level**: Employer-specific features
**Authentication**: Required, with company verification
**Permissions**:
- ✅ All Anonymous User permissions
- ✅ Access Employer Portal dashboard
- ✅ Post internship/job opportunities
- ✅ Browse student profiles (limited info)
- ✅ Manage posted positions
- ✅ Access employer resources and guides
- ✅ Submit partnership requests
- ❌ Cannot access student applications or admin features

### 4. AUI Staff/Admin
**Access Level**: Full system administration
**Authentication**: Required, AUI email domain
**Permissions**:
- ✅ Full access to all content and features
- ✅ Admin dashboard with analytics
- ✅ Manage all user accounts
- ✅ Review and approve applications
- ✅ Update program content and requirements
- ✅ Generate reports and statistics
- ✅ Manage employer partnerships
- ✅ Content management system access

## Permission Matrix
| Feature | Anonymous | Student | Employer | Admin |
|---------|-----------|---------|----------|--------|
| View Programs | ✅ | ✅ | ✅ | ✅ |
| Apply to Programs | ❌ | ✅ | ❌ | ✅ |
| Access Student Portal | ❌ | ✅ | ❌ | ✅ |
| Access Employer Portal | ❌ | ❌ | ✅ | ✅ |
| Post Opportunities | ❌ | ❌ | ✅ | ✅ |
| View Analytics | ❌ | Limited | Limited | ✅ |
| Manage Content | ❌ | ❌ | ❌ | ✅ |
EOF

# Create detailed page specifications
cat > docs/architecture/page-specifications.md << 'EOF'
# Detailed Page Specifications

## 1. Homepage (/)
**Purpose**: First impression, program overview, quick access
**Key Elements**:
- Hero section with value proposition
- Three main program cards (Co-op, Remote@AUI, Alternance)
- Impact metrics display (students placed, partner companies, success rate)
- Quick action buttons (Apply Now, Partner With Us)
- Latest success stories carousel
- Upcoming events/deadlines
- AUI branding integration

**Content Sections**:
1. Hero: "Bridging Academia and Industry"
2. Programs Overview: 3-column layout
3. By the Numbers: Key metrics grid
4. Success Stories: Testimonial slider
5. Get Started: Dual CTA (Students/Employers)
6. News & Updates: Latest announcements

## 2. Program Pages (/programs/*)
**Purpose**: Detailed program information and requirements
**Shared Structure**:
- Program hero with key details
- Overview and objectives
- Requirements and eligibility
- Application process timeline
- Success stories specific to program
- FAQ section
- Apply Now CTA

**Program-Specific Content**:
- **Co-op**: Traditional industry placement focus
- **Remote@AUI**: Global opportunities, digital skills
- **Alternance**: Work-study balance, extended timeline

## 3. Student Portal (/students/portal)
**Purpose**: Application management and progress tracking
**Dashboard Sections**:
- Application status overview
- Profile completion progress
- Recommended opportunities
- Upcoming deadlines
- Document upload center
- Messages/notifications
- Program history

## 4. Employer Portal (/employers/portal)
**Purpose**: Partnership management and opportunity posting
**Dashboard Sections**:
- Active job postings
- Applicant management
- Company profile settings
- Partnership status
- Resources and guides
- Analytics (applications received)
- AUI contact information

## 5. Impact Page (/impact)
**Purpose**: Showcase program success and outcomes
**Content Sections**:
- Key statistics and trends
- Student success stories
- Employer testimonials
- Industry partnerships showcase
- Academic impact metrics
- Alumni network highlights
EOF

# Create comprehensive UI component inventory
cat > docs/architecture/component-inventory.md << 'EOF'
# Complete UI Component Inventory

## Navigation Components
### Navbar
- **Purpose**: Primary site navigation
- **Elements**: Logo, menu items, search, login/profile
- **Responsive**: Hamburger menu on mobile
- **Variants**: Default, authenticated user

### Footer
- **Purpose**: Secondary navigation and info
- **Elements**: Links, contact info, social media, AUI branding
- **Sections**: Quick links, programs, contact, legal

### Breadcrumbs
- **Purpose**: Navigation context
- **Usage**: All internal pages except homepage

## Content Components
### Hero Section
- **Variants**: 
  - Homepage hero (full-screen with CTA)
  - Page hero (smaller with title/subtitle)
  - Program hero (with key metrics)

### Program Cards
- **Purpose**: Program overview display
- **Elements**: Icon, title, description, CTA button, key stats
- **Variants**: Grid layout (3-column), list layout

### Metrics Grid
- **Purpose**: Display impact statistics
- **Elements**: Number, label, icon, growth indicator
- **Layout**: Responsive grid (2x2, 3x2, 4x1)

### Testimonial Carousel
- **Purpose**: Success stories and quotes
- **Elements**: Photo, quote, name, title, program
- **Features**: Auto-play, navigation dots, responsive

### CTA Sections
- **Variants**:
  - Dual CTA (Students/Employers)
  - Single action CTA
  - Inline text CTA

## Form Components
### Application Forms
- **Student Application**: Multi-step wizard
- **Employer Registration**: Company verification
- **Contact Forms**: Simple inquiry forms

### Form Elements
- **Input Fields**: Text, email, phone, file upload
- **Select Dropdowns**: Program selection, country
- **Checkboxes**: Terms agreement, preferences
- **Text Areas**: Essays, descriptions
- **Progress Indicators**: Multi-step forms

## Dashboard Components
### Dashboard Layout
- **Sidebar Navigation**: Main menu for portals
- **Content Area**: Dynamic content based on selection
- **Header Bar**: User info, notifications, logout

### Data Tables
- **Purpose**: Applications, opportunities, users
- **Features**: Sorting, filtering, pagination, search
- **Actions**: View, edit, delete, approve

### Status Indicators
- **Application Status**: Pending, under review, approved, rejected
- **User Status**: Active, inactive, verified
- **Visual**: Color-coded badges and icons

## Interactive Components
### Modal/Dialog
- **Usage**: Confirmations, detailed views, forms
- **Variants**: Small, medium, large, full-screen

### Dropdown Menus
- **Usage**: User account, program selection, filters
- **Features**: Hover/click trigger, keyboard navigation

### Tabs
- **Usage**: Program details, dashboard sections
- **Variants**: Horizontal, vertical, pills

### Accordion
- **Usage**: FAQ, program requirements
- **Features**: Single/multiple expand, icons

## Media Components
### Image Gallery
- **Usage**: Success stories, company logos, events
- **Features**: Lightbox, thumbnails, captions

### Video Player
- **Usage**: Program introductions, testimonials
- **Features**: Custom controls, responsive

## Utility Components
### Loading States
- **Spinners**: Page loading, form submission
- **Skeletons**: Content placeholders
- **Progress Bars**: File uploads, form completion

### Alert/Notification
- **Types**: Success, error, warning, info
- **Display**: Toast, banner, inline

### Pagination
- **Usage**: Search results, data tables
- **Features**: Previous/next, page numbers, items per page

## AUI Brand Integration
### Brand Colors
- **Primary**: AUI Blue (#003366)
- **Secondary**: AUI Gold (#FFD700)
- **Accent**: Teal (#008080)
- **Neutral**: Grays for text and backgrounds

### Typography
- **Headers**: Montserrat/Similar sans-serif
- **Body**: Open Sans/System fonts
- **Hierarchy**: H1-H6 defined, consistent spacing

### Logo Usage
- **Header**: Full logo with text
- **Footer**: Simplified mark
- **Favicon**: Icon version
EOF

# Create detailed user flow diagrams
cat > docs/architecture/user-flows.md << 'EOF'
# User Flow Diagrams & Journey Maps

## Student Application Flow
```
1. Discover Program
   ↓
2. Learn More (Program Page)
   ↓
3. Check Eligibility
   ↓
4. Create Account / Login
   ↓
5. Complete Profile
   ↓
6. Start Application
   ↓
7. Multi-step Form:
   - Personal Information
   - Academic Background
   - Program Preferences
   - Essays/Statements
   - Document Upload
   ↓
8. Review & Submit
   ↓
9. Confirmation & Next Steps
   ↓
10. Track Status (Portal)
```

## Employer Partnership Flow
```
1. Learn About Programs
   ↓
2. Partnership Information Page
   ↓
3. Register Company Account
   ↓
4. Company Verification Process
   ↓
5. Access Employer Portal
   ↓
6. Complete Company Profile
   ↓
7. Post First Opportunity
   ↓
8. Review Student Applications
   ↓
9. Ongoing Partnership Management
```

## Admin Management Flow
```
1. Admin Login
   ↓
2. Dashboard Overview
   ↓
3. Review Pending Items:
   - Student Applications
   - Employer Registrations
   - Posted Opportunities
   ↓
4. Process Approvals/Rejections
   ↓
5. Update Content/Programs
   ↓
6. Generate Reports
   ↓
7. Manage User Accounts
```

## Information Architecture Priorities
1. **Discoverability**: Programs easy to find and understand
2. **Application Ease**: Streamlined, multi-step process
3. **Transparency**: Clear status tracking and communication
4. **Scalability**: Support growing number of users and programs
5. **Mobile-First**: Optimized for mobile usage patterns
EOF

# Create technical requirements and constraints
cat > docs/architecture/technical-requirements.md << 'EOF'
# Technical Requirements & Constraints

## Performance Requirements
- **Page Load Time**: < 3 seconds on 3G connection
- **Time to Interactive**: < 5 seconds
- **Lighthouse Score**: 90+ for Performance, Accessibility, SEO
- **Mobile Performance**: Optimized for mobile-first usage

## Accessibility Requirements
- **WCAG 2.1 Level AA Compliance**
- **Keyboard Navigation**: All interactive elements accessible
- **Screen Reader Support**: Proper ARIA labels and structure
- **Color Contrast**: 4.5:1 minimum ratio
- **Focus Indicators**: Clear visual focus states

## Browser Support
- **Modern Browsers**: Chrome 90+, Firefox 88+, Safari 14+, Edge 90+
- **Mobile**: iOS Safari 14+, Chrome Mobile 90+
- **Graceful Degradation**: Basic functionality on older browsers

## SEO Requirements
- **Meta Tags**: Dynamic titles, descriptions, Open Graph
- **Structured Data**: Schema.org markup for programs and organizations
- **XML Sitemap**: Auto-generated and submitted
- **URL Structure**: Clean, semantic URLs
- **Page Speed**: Optimized images, lazy loading, CDN

## Security Requirements
- **Authentication**: JWT tokens, secure password requirements
- **Data Protection**: GDPR compliance, data encryption
- **Form Security**: CSRF protection, input validation
- **File Uploads**: Virus scanning, file type restrictions
- **API Security**: Rate limiting, authentication required

## Hosting & Deployment
- **Domain**: wil.aui.ma (managed by AUI IT)
- **SSL Certificate**: Required for all traffic
- **Backup Strategy**: Daily automated backups
- **Monitoring**: Uptime monitoring, error tracking
- **Scalability**: Support 1000+ concurrent users

## Integration Requirements
- **AUI Systems**: SSO integration (future phase)
- **Email Service**: Automated notifications and confirmations
- **Analytics**: Google Analytics, custom event tracking
- **File Storage**: Document management for applications
- **API Documentation**: Complete API docs for future integrations
EOF

# Create development workflow and standards
cat > docs/architecture/development-standards.md << 'EOF'
# Development Standards & Workflow

## Code Standards
### Frontend (React/Next.js)
- **Style Guide**: Airbnb JavaScript Style Guide
- **Formatting**: Prettier with ESLint
- **Component Structure**: Functional components with hooks
- **State Management**: React Context + useReducer
- **Styling**: TailwindCSS utility classes
- **File Naming**: kebab-case for files, PascalCase for components

### Backend (Express.js)
- **Style Guide**: Airbnb JavaScript Style Guide
- **API Design**: RESTful endpoints, consistent responses
- **Error Handling**: Centralized error middleware
- **Validation**: Joi or similar for input validation
- **Documentation**: OpenAPI/Swagger specification
- **File Structure**: Feature-based organization

## Git Workflow
### Branch Strategy
- **main**: Production-ready code
- **develop**: Integration branch for features
- **feature/***: Individual feature development
- **hotfix/***: Critical production fixes

### Commit Standards
- **Format**: Conventional Commits specification
- **Examples**:
  - `feat: add student application form`
  - `fix: resolve mobile navigation issue`
  - `docs: update API documentation`

## Testing Requirements
### Frontend Testing
- **Unit Tests**: Jest + React Testing Library
- **Integration Tests**: Key user flows
- **E2E Tests**: Cypress for critical paths
- **Visual Regression**: Screenshot comparison

### Backend Testing
- **Unit Tests**: Jest for individual functions
- **Integration Tests**: Supertest for API endpoints
- **Database Tests**: Test database with seed data
- **Load Testing**: Performance under stress

## Quality Assurance
### Code Review Process
1. Feature branch created from develop
2. Implementation and self-testing
3. Pull request with description and screenshots
4. Code review by team member
5. Automated tests pass
6. Merge to develop

### Definition of Done
- [ ] Feature implemented according to requirements
- [ ] Unit tests written and passing
- [ ] Integration tests passing
- [ ] Code reviewed and approved
- [ ] Documentation updated
- [ ] Accessibility tested
- [ ] Mobile responsive
- [ ] Performance benchmarks met

## Deployment Pipeline
### Staging Environment
- **Purpose**: Testing and client review
- **Trigger**: Push to develop branch
- **URL**: staging.wil.aui.ma (internal)

### Production Environment
- **Purpose**: Live platform
- **Trigger**: Manual deployment from main branch
- **URL**: wil.aui.ma
- **Monitoring**: Automated health checks and alerts
EOF

# Create initial wireframe specifications for Claude
cat > docs/architecture/wireframe-specs.md << 'EOF'
# Wireframe Specifications for Development

## Homepage Wireframe Requirements
### Header Section
- **Logo**: AUI logo positioned top-left
- **Navigation**: Horizontal menu (Programs, Students, Employers, Impact, Resources)
- **CTA Button**: "Apply Now" or "Login" top-right
- **Mobile**: Hamburger menu for navigation

### Hero Section
- **Background**: High-quality image of AUI campus or students
- **Overlay**: Semi-transparent dark overlay for text readability
- **Title**: "Work-Based Learning @ AUI" (H1)
- **Subtitle**: Value proposition in 1-2 sentences
- **CTA Buttons**: "Explore Programs" and "Partner With Us"
- **Dimensions**: Full viewport height on desktop, 60% on mobile

### Programs Section
- **Layout**: 3-column grid on desktop, stacked on mobile
- **Cards**: Program title, brief description, key stat, "Learn More" button
- **Order**: Co-op, Remote@AUI, Alternance
- **Background**: Light gray or white section

### Metrics Section
- **Layout**: 4-column grid on desktop, 2x2 on mobile
- **Metrics**: Students Placed, Partner Companies, Success Rate, Average Salary
- **Style**: Large numbers with descriptive labels
- **Background**: Colored section (AUI blue or teal)

### Success Stories Section
- **Layout**: Horizontal scrolling carousel
- **Cards**: Student photo, quote, name, program, company
- **Controls**: Navigation arrows and dots
- **Auto-play**: 5-second intervals

### Footer Section
- **Columns**: 4 columns on desktop (About, Programs, Resources, Contact)
- **Content**: Links, contact info, social media icons
- **Bottom**: Copyright, AUI branding, legal links

## Program Page Wireframe Requirements
### Program Hero
- **Background**: Program-specific imagery
- **Content**: Program name, key details (duration, requirements)
- **CTA**: "Apply Now" button
- **Breadcrumbs**: Navigation context

### Content Sections
1. **Overview**: Program description and objectives
2. **Requirements**: Eligibility criteria and prerequisites
3. **Process**: Application timeline and steps
4. **Benefits**: What students gain from the program
5. **Success Stories**: Program-specific testimonials
6. **FAQ**: Common questions and answers

### Sidebar (Desktop)
- **Quick Info**: Key program details
- **Apply Button**: Persistent CTA
- **Contact Info**: Program coordinator details
- **Related Programs**: Links to other programs

## Portal Dashboard Wireframes
### Student Portal Layout
- **Sidebar**: Navigation menu (Dashboard, Applications, Profile, Documents)
- **Header**: Welcome message, notifications, profile dropdown
- **Main Content**: Dynamic based on sidebar selection
- **Dashboard Cards**: Application status, upcoming deadlines, recommendations

### Employer Portal Layout
- **Sidebar**: Navigation menu (Dashboard, Opportunities, Applications, Profile)
- **Header**: Company name, notifications, account dropdown
- **Main Content**: Posted jobs, applicant management, company profile
- **Quick Actions**: Post new opportunity, view applications

## Responsive Breakpoints
- **Mobile**: 320px - 768px
- **Tablet**: 768px - 1024px
- **Desktop**: 1024px+

## Component Sizing
- **Max Width**: 1200px for main content
- **Margins**: 20px mobile, 40px tablet, 60px desktop
- **Button Heights**: 44px minimum for touch targets
- **Card Spacing**: 20px gaps between cards
EOF

# Commit all Phase 1 work
git add .
git commit -m "Phase 1: Complete Planning & Architecture

- Comprehensive sitemap with all pages and navigation
- Detailed user roles and permissions matrix  
- Complete page specifications for all major pages
- Full UI component inventory with variants
- User flow diagrams for all user types
- Technical requirements and constraints
- Development standards and workflow
- Wireframe specifications ready for Claude implementation"

echo "🎯 PHASE 1 COMPLETE!"
echo ""
echo "📋 Architecture Documents Created:"
echo "  ├── sitemap.md - Complete site structure"
echo "  ├── user-roles.md - Roles and permissions matrix"
echo "  ├── page-specifications.md - Detailed page requirements"
echo "  ├── component-inventory.md - Full UI component list"
echo "  ├── user-flows.md - User journey diagrams"
echo "  ├── technical-requirements.md - Performance and security specs"
echo "  ├── development-standards.md - Code standards and workflow"
echo "  └── wireframe-specs.md - Ready for Claude wireframe creation"
echo ""
echo "✅ Phase 1 Complete - Ready for Phase 2: UI/UX Design & Wireframes"
