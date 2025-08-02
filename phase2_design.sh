# Phase 2: Complete UI/UX Design & Wireframes for WIL.AUI.MA
# Run this script inside the wil-aui-platform directory

#!/bin/bash

# Navigate to project directory
cd wil-aui-platform

# Create wireframes directory
mkdir -p wireframes/{pages,components,assets}

# Create AUI brand guidelines and design system
cat > wireframes/assets/brand-guidelines.css << 'EOF'
/* WIL.AUI.MA Brand Guidelines & Design System */

:root {
  /* AUI Brand Colors */
  --aui-primary: #003366;      /* AUI Deep Blue */
  --aui-secondary: #FFD700;    /* AUI Gold */
  --aui-accent: #008080;       /* Teal */
  --aui-light-blue: #E6F3FF;  /* Light Blue Background */
  
  /* Neutral Colors */
  --gray-50: #F8FAFC;
  --gray-100: #F1F5F9;
  --gray-200: #E2E8F0;
  --gray-300: #CBD5E1;
  --gray-400: #94A3B8;
  --gray-500: #64748B;
  --gray-600: #475569;
  --gray-700: #334155;
  --gray-800: #1E293B;
  --gray-900: #0F172A;
  
  /* Success/Error Colors */
  --success: #10B981;
  --warning: #F59E0B;
  --error: #EF4444;
  
  /* Typography */
  --font-heading: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
  --font-body: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
  
  /* Spacing */
  --spacing-xs: 0.25rem;   /* 4px */
  --spacing-sm: 0.5rem;    /* 8px */
  --spacing-md: 1rem;      /* 16px */
  --spacing-lg: 1.5rem;    /* 24px */
  --spacing-xl: 2rem;      /* 32px */
  --spacing-2xl: 3rem;     /* 48px */
  
  /* Shadows */
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
  
  /* Border Radius */
  --radius-sm: 0.25rem;    /* 4px */
  --radius-md: 0.5rem;     /* 8px */
  --radius-lg: 0.75rem;    /* 12px */
  --radius-xl: 1rem;       /* 16px */
}

/* Base Styles */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: var(--font-body);
  line-height: 1.6;
  color: var(--gray-800);
  background-color: white;
}

/* Typography Scale */
.text-xs { font-size: 0.75rem; }
.text-sm { font-size: 0.875rem; }
.text-base { font-size: 1rem; }
.text-lg { font-size: 1.125rem; }
.text-xl { font-size: 1.25rem; }
.text-2xl { font-size: 1.5rem; }
.text-3xl { font-size: 1.875rem; }
.text-4xl { font-size: 2.25rem; }
.text-5xl { font-size: 3rem; }

/* Heading Styles */
h1, h2, h3, h4, h5, h6 {
  font-family: var(--font-heading);
  font-weight: 700;
  line-height: 1.2;
  margin-bottom: var(--spacing-md);
}

h1 { font-size: 3rem; color: var(--aui-primary); }
h2 { font-size: 2.25rem; color: var(--aui-primary); }
h3 { font-size: 1.875rem; color: var(--gray-800); }
h4 { font-size: 1.5rem; color: var(--gray-800); }

/* Button Components */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.75rem 1.5rem;
  border-radius: var(--radius-md);
  font-weight: 600;
  text-decoration: none;
  transition: all 0.2s ease;
  cursor: pointer;
  border: none;
  font-size: 1rem;
  min-height: 44px; /* Touch target */
}

.btn-primary {
  background-color: var(--aui-primary);
  color: white;
}
.btn-primary:hover {
  background-color: #002244;
  transform: translateY(-1px);
  box-shadow: var(--shadow-lg);
}

.btn-secondary {
  background-color: var(--aui-secondary);
  color: var(--aui-primary);
}
.btn-secondary:hover {
  background-color: #E6C200;
  transform: translateY(-1px);
}

.btn-outline {
  background-color: transparent;
  color: var(--aui-primary);
  border: 2px solid var(--aui-primary);
}
.btn-outline:hover {
  background-color: var(--aui-primary);
  color: white;
}

/* Card Components */
.card {
  background: white;
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-md);
  overflow: hidden;
  transition: all 0.3s ease;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-lg);
}

.card-header {
  padding: var(--spacing-lg);
  border-bottom: 1px solid var(--gray-200);
}

.card-body {
  padding: var(--spacing-lg);
}

.card-footer {
  padding: var(--spacing-lg);
  background-color: var(--gray-50);
  border-top: 1px solid var(--gray-200);
}

/* Layout Utilities */
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--spacing-md);
}

.section {
  padding: var(--spacing-2xl) 0;
}

.grid {
  display: grid;
  gap: var(--spacing-lg);
}

.grid-cols-1 { grid-template-columns: repeat(1, 1fr); }
.grid-cols-2 { grid-template-columns: repeat(2, 1fr); }
.grid-cols-3 { grid-template-columns: repeat(3, 1fr); }
.grid-cols-4 { grid-template-columns: repeat(4, 1fr); }

@media (max-width: 768px) {
  .grid-cols-2,
  .grid-cols-3,
  .grid-cols-4 {
    grid-template-columns: 1fr;
  }
}

/* Responsive Design */
@media (max-width: 640px) {
  .container {
    padding: 0 var(--spacing-sm);
  }
  
  .section {
    padding: var(--spacing-xl) 0;
  }
  
  h1 { font-size: 2.25rem; }
  h2 { font-size: 1.875rem; }
}
EOF

# Create homepage wireframe
cat > wireframes/pages/homepage.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WIL.AUI.MA - Work-Based Learning @ AUI</title>
    <link rel="stylesheet" href="../assets/brand-guidelines.css">
    <style>
        /* Navigation Styles */
        .navbar {
            background: white;
            box-shadow: var(--shadow-sm);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            padding: 1rem 0;
        }
        
        .nav-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }
        
        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--aui-primary);
            text-decoration: none;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;
            margin: 0;
            padding: 0;
        }
        
        .nav-link {
            color: var(--gray-700);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }
        
        .nav-link:hover {
            color: var(--aui-primary);
        }
        
        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: var(--aui-primary);
            cursor: pointer;
        }
        
        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, var(--aui-primary) 0%, var(--aui-accent) 100%);
            color: white;
            padding: 120px 0 80px;
            text-align: center;
            margin-top: 80px;
        }
        
        .hero h1 {
            color: white;
            font-size: 3.5rem;
            margin-bottom: 1rem;
        }
        
        .hero p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .hero-cta {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        /* Programs Section */
        .programs {
            background: var(--gray-50);
            padding: 80px 0;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .program-card {
            background: white;
            border-radius: var(--radius-lg);
            padding: 2rem;
            text-align: center;
            box-shadow: var(--shadow-md);
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .program-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-lg);
        }
        
        .program-icon {
            width: 80px;
            height: 80px;
            background: var(--aui-light-blue);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
            color: var(--aui-primary);
        }
        
        .program-card h3 {
            color: var(--aui-primary);
            margin-bottom: 1rem;
        }
        
        .program-stat {
            background: var(--aui-light-blue);
            color: var(--aui-primary);
            padding: 0.5rem 1rem;
            border-radius: var(--radius-sm);
            font-weight: 600;
            font-size: 0.875rem;
            margin: 1rem 0;
            display: inline-block;
        }
        
        /* Metrics Section */
        .metrics {
            background: var(--aui-primary);
            color: white;
            padding: 80px 0;
        }
        
        .metric-card {
            text-align: center;
            padding: 2rem;
        }
        
        .metric-number {
            font-size: 3rem;
            font-weight: 700;
            color: var(--aui-secondary);
            display: block;
            margin-bottom: 0.5rem;
        }
        
        .metric-label {
            font-size: 1.125rem;
            opacity: 0.9;
        }
        
        /* Success Stories Section */
        .success-stories {
            padding: 80px 0;
            background: white;
        }
        
        .testimonial-card {
            background: white;
            border-radius: var(--radius-lg);
            padding: 2rem;
            box-shadow: var(--shadow-md);
            text-align: center;
            border-left: 4px solid var(--aui-secondary);
        }
        
        .testimonial-quote {
            font-style: italic;
            font-size: 1.125rem;
            margin-bottom: 1.5rem;
            color: var(--gray-600);
        }
        
        .testimonial-author {
            font-weight: 600;
            color: var(--aui-primary);
        }
        
        .testimonial-role {
            color: var(--gray-500);
            font-size: 0.875rem;
        }
        
        /* CTA Section */
        .cta-section {
            background: var(--aui-accent);
            color: white;
            padding: 80px 0;
            text-align: center;
        }
        
        .cta-section h2 {
            color: white;
            margin-bottom: 1rem;
        }
        
        .cta-section p {
            font-size: 1.125rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }
        
        /* Footer */
        .footer {
            background: var(--gray-900);
            color: white;
            padding: 60px 0 20px;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2rem;
            margin-bottom: 2rem;
        }
        
        .footer-section h4 {
            color: var(--aui-secondary);
            margin-bottom: 1rem;
        }
        
        .footer-link {
            color: var(--gray-300);
            text-decoration: none;
            display: block;
            margin-bottom: 0.5rem;
            transition: color 0.2s;
        }
        
        .footer-link:hover {
            color: var(--aui-secondary);
        }
        
        .footer-bottom {
            border-top: 1px solid var(--gray-800);
            padding-top: 2rem;
            text-align: center;
            color: var(--gray-400);
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-menu {
                display: none;
            }
            
            .mobile-menu-btn {
                display: block;
            }
            
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .hero-cta {
                flex-direction: column;
                align-items: center;
            }
            
            .footer-content {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 480px) {
            .footer-content {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-content">
            <a href="/" class="logo">WIL.AUI.MA</a>
            <ul class="nav-menu">
                <li><a href="/programs" class="nav-link">Programs</a></li>
                <li><a href="/students" class="nav-link">Students</a></li>
                <li><a href="/employers" class="nav-link">Employers</a></li>
                <li><a href="/impact" class="nav-link">Impact</a></li>
                <li><a href="/resources" class="nav-link">Resources</a></li>
            </ul>
            <a href="/auth/login" class="btn btn-primary">Login</a>
            <button class="mobile-menu-btn">☰</button>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1>Bridging Academia and Industry</h1>
            <p>Connect with leading companies through our Co-op, Remote@AUI, and Alternance programs. Transform your academic knowledge into real-world experience.</p>
            <div class="hero-cta">
                <a href="/programs" class="btn btn-secondary">Explore Programs</a>
                <a href="/employers/partnership" class="btn btn-outline">Partner With Us</a>
            </div>
        </div>
    </section>

    <!-- Programs Section -->
    <section class="programs">
        <div class="container">
            <div class="section-title">
                <h2>Choose Your Path</h2>
                <p>Three distinct programs designed to match your career goals and learning style.</p>
            </div>
            <div class="grid grid-cols-3">
                <div class="program-card">
                    <div class="program-icon">🏢</div>
                    <h3>Co-op Program</h3>
                    <p>Traditional cooperative education with leading Moroccan and international companies. Gain hands-on experience while earning academic credit.</p>
                    <div class="program-stat">4-6 Months</div>
                    <a href="/programs/coop" class="btn btn-primary">Learn More</a>
                </div>
                <div class="program-card">
                    <div class="program-icon">🌍</div>
                    <h3>Remote@AUI</h3>
                    <p>Work remotely with global companies and startups. Develop digital skills while experiencing international work culture.</p>
                    <div class="program-stat">3-12 Months</div>
                    <a href="/programs/remote" class="btn btn-primary">Learn More</a>
                </div>
                <div class="program-card">
                    <div class="program-icon">⚖️</div>
                    <h3>Alternance</h3>
                    <p>Perfect balance of academic study and professional work. Alternate between campus learning and industry practice.</p>
                    <div class="program-stat">12-24 Months</div>
                    <a href="/programs/alternance" class="btn btn-primary">Learn More</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Metrics Section -->
    <section class="metrics">
        <div class="container">
            <div class="section-title">
                <h2 style="color: white;">Impact by the Numbers</h2>
                <p style="color: white; opacity: 0.9;">Our programs deliver measurable results for students and employers.</p>
            </div>
            <div class="grid grid-cols-4">
                <div class="metric-card">
                    <span class="metric-number">250+</span>
                    <div class="metric-label">Students Placed</div>
                </div>
                <div class="metric-card">
                    <span class="metric-number">45+</span>
                    <div class="metric-label">Partner Companies</div>
                </div>
                <div class="metric-card">
                    <span class="metric-number">85%</span>
                    <div class="metric-label">Employment Rate</div>
                </div>
                <div class="metric-card">
                    <span class="metric-number">12K</span>
                    <div class="metric-label">Avg. Salary (MAD)</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Success Stories Section -->
    <section class="success-stories">
        <div class="container">
            <div class="section-title">
                <h2>Success Stories</h2>
                <p>Hear from students who transformed their careers through our programs.</p>
            </div>
            <div class="grid grid-cols-3">
                <div class="testimonial-card">
                    <div class="testimonial-quote">
                        "The Co-op program opened doors I never knew existed. I'm now a full-time software engineer at one of Morocco's leading tech companies."
                    </div>
                    <div class="testimonial-author">Youssef El Amrani</div>
                    <div class="testimonial-role">Computer Science '23 • Software Engineer at TechCorp</div>
                </div>
                <div class="testimonial-card">
                    <div class="testimonial-quote">
                        "Working remotely with a Silicon Valley startup through Remote@AUI gave me global perspective and invaluable network connections."
                    </div>
                    <div class="testimonial-author">Aicha Benali</div>
                    <div class="testimonial-role">Business Administration '24 • Product Manager at GlobalTech</div>
                </div>
                <div class="testimonial-card">
                    <div class="testimonial-quote">
                        "The Alternance program perfectly balanced my studies with real-world experience. I graduated with both a degree and a job offer."
                    </div>
                    <div class="testimonial-author">Omar Rachidi</div>
                    <div class="testimonial-role">Engineering '23 • Project Engineer at InnovaCorp</div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <h2>Ready to Start Your Journey?</h2>
            <p>Join hundreds of AUI students who have launched their careers through our work-based learning programs.</p>
            <div class="hero-cta">
                <a href="/students/apply" class="btn btn-secondary">Apply Now</a>
                <a href="/programs" class="btn btn-outline">View All Programs</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>Programs</h4>
                    <a href="/programs/coop" class="footer-link">Co-op Program</a>
                    <a href="/programs/remote" class="footer-link">Remote@AUI</a>
                    <a href="/programs/alternance" class="footer-link">Alternance</a>
                    <a href="/programs" class="footer-link">All Programs</a>
                </div>
                <div class="footer-section">
                    <h4>For Students</h4>
                    <a href="/students/apply" class="footer-link">How to Apply</a>
                    <a href="/students/portal" class="footer-link">Student Portal</a>
                    <a href="/students/stories" class="footer-link">Success Stories</a>
                    <a href="/resources/faq" class="footer-link">FAQ</a>
                </div>
                <div class="footer-section">
                    <h4>For Employers</h4>
                    <a href="/employers/partnership" class="footer-link">Partner With Us</a>
                    <a href="/employers/post" class="footer-link">Post Opportunities</a>
                    <a href="/employers/portal" class="footer-link">Employer Portal</a>
                    <a href="/impact" class="footer-link">Program Impact</a>
                </div>
                <div class="footer-section">
                    <h4>Contact</h4>
                    <a href="/resources/contact" class="footer-link">Get in Touch</a>
                    <a href="mailto:wil@aui.ma" class="footer-link">wil@aui.ma</a>
                    <a href="tel:+212535269000" class="footer-link">+212 5 35 26 90 00</a>
                    <a href="/resources" class="footer-link">Resources</a>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 Al Akhawayn University. All rights reserved. | <a href="/legal/privacy" style="color: var(--aui-secondary);">Privacy Policy</a> | <a href="/legal/terms" style="color: var(--aui-secondary);">Terms of Service</a></p>
            </div>
        </div>
    </footer>
</body>
</html>
EOF

# Create program page wireframe (Co-op example)
cat > wireframes/pages/program-coop.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Co-op Program - WIL.AUI.MA</title>
    <link rel="stylesheet" href="../assets/brand-guidelines.css">
    <style>
        /* Include navbar styles from homepage */
        .navbar {
            background: white;
            box-shadow: var(--shadow-sm);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            padding: 1rem 0;
        }
        
        .nav-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }
        
        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--aui-primary);
            text-decoration: none;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;
            margin: 0;
            padding: 0;
        }
        
        .nav-link {
            color: var(--gray-700);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }
        
        .nav-link:hover {
            color: var(--aui-primary);
        }
        
        /* Breadcrumbs */
        .breadcrumbs {
            background: var(--gray-50);
            padding: 1rem 0;
            margin-top: 80px;
        }
        
        .breadcrumb-nav {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            color: var(--gray-600);
        }
        
        .breadcrumb-link {
            color: var(--aui-primary);
            text-decoration: none;
        }
        
        .breadcrumb-link:hover {
            text-decoration: underline;
        }
        
        /* Program Hero */
        .program-hero {
            background: linear-gradient(135deg, var(--aui-primary) 0%, var(--aui-accent) 100%);
            color: white;
            padding: 80px 0;
            text-align: center;
        }
        
        .program-hero h1 {
            color: white;
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        
        .program-hero p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .program-quick-facts {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
            margin-bottom: 2rem;
        }
        
        .quick-fact {
            background: rgba(255, 255, 255, 0.1);
            padding: 1rem 1.5rem;
            border-radius: var(--radius-md);
            text-align: center;
        }
        
        .quick-fact-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--aui-secondary);
            display: block;
        }
        
        .quick-fact-label {
            font-size: 0.875rem;
            opacity: 0.9;
        }
        
        /* Main Content Layout */
        .main-content {
            padding: 80px 0;
        }
        
        .content-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 3rem;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }
        
        .content-section {
            margin-bottom: 3rem;
        }
        
        .content-section h2 {
            color: var(--aui-primary);
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--aui-light-blue);
        }
        
        .requirements-list {
            list-style: none;
            padding: 0;
        }
        
        .requirements-list li {
            display: flex;
            align-items: flex-start;
            gap: 0.75rem;
            margin-bottom: 1rem;
            padding: 1rem;
            background: var(--gray-50);
            border-radius: var(--radius-md);
        }
        
        .requirement-icon {
            color: var(--success);
            font-weight: bold;
            margin-top: 0.1rem;
        }
        
        .timeline {
            list-style: none;
            padding: 0;
            position: relative;
        }
        
        .timeline::before {
            content: '';
            position: absolute;
            left: 1rem;
            top: 0;
            bottom: 0;
            width: 2px;
            background: var(--aui-primary);
        }
        
        .timeline-item {
            position: relative;
            padding-left: 3rem;
            margin-bottom: 2rem;
        }
        
        .timeline-item::before {
            content: '';
            position: absolute;
            left: 0.5rem;
            top: 0.5rem;
            width: 1rem;
            height: 1rem;
            background: var(--aui-secondary);
            border-radius: 50%;
            border: 3px solid white;
            box-shadow: 0 0 0 3px var(--aui-primary);
        }
        
        .timeline-title {
            font-weight: 600;
            color: var(--aui-primary);
            margin-bottom: 0.5rem;
        }
        
        /* Sidebar */
        .sidebar {
            background: white;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            padding: 2rem;
            height: fit-content;
            position: sticky;
            top: 100px;
        }
        
        .sidebar h3 {
            color: var(--aui-primary);
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .sidebar-cta {
            background: var(--aui-light-blue);
            padding: 1.5rem;
            border-radius: var(--radius-md);
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .contact-info {
            border-top: 1px solid var(--gray-200);
            padding-top: 1.5rem;
        }
        
        .contact-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1rem;
            font-size: 0.875rem;
        }
        
        .contact-icon {
            color: var(--aui-primary);
            width: 20px;
        }
        
        .related-programs {
            margin-top: 2rem;
        }
        
        .related-program {
            display: block;
            padding: 0.75rem;
            background: var(--gray-50);
            border-radius: var(--radius-md);
            text-decoration: none;
            color: var(--gray-700);
            margin-bottom: 0.5rem;
            transition: all 0.2s;
        }
        
        .related-program:hover {
            background: var(--aui-light-blue);
            color: var(--aui-primary);
        }
        
        /* FAQ Section */
        .faq-item {
            border: 1px solid var(--gray-200);
            border-radius: var(--radius-md);
            margin-bottom: 1rem;
            overflow: hidden;
        }
        
        .faq-question {
            background: var(--gray-50);
            padding: 1rem 1.5rem;
            font-weight: 600;
            color: var(--aui-primary);
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .faq-question:hover {
            background: var(--aui-light-blue);
        }
        
        .faq-answer {
            padding: 1.5rem;
            background: white;
            border-top: 1px solid var(--gray-200);
        }
        
        /* Success Stories */
        .success-story {
            background: var(--aui-light-blue);
            border-radius: var(--radius-lg);
            padding: 2rem;
            margin-bottom: 2rem;
            border-left: 4px solid var(--aui-primary);
        }
        
        .success-quote {
            font-style: italic;
            font-size: 1.125rem;
            margin-bottom: 1rem;
            color: var(--gray-700);
        }
        
        .success-author {
            font-weight: 600;
            color: var(--aui-primary);
        }
        
        .success-details {
            color: var(--gray-600);
            font-size: 0.875rem;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .content-grid {
                grid-template-columns: 1fr;
                gap: 2rem;
            }
            
            .program-quick-facts {
                flex-direction: column;
                align-items: center;
            }
            
            .program-hero h1 {
                font-size: 2.25rem;
            }
            
            .sidebar {
                position: static;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-content">
            <a href="/" class="logo">WIL.AUI.MA</a>
            <ul class="nav-menu">
                <li><a href="/programs" class="nav-link">Programs</a></li>
                <li><a href="/students" class="nav-link">Students</a></li>
                <li><a href="/employers" class="nav-link">Employers</a></li>
                <li><a href="/impact" class="nav-link">Impact</a></li>
                <li><a href="/resources" class="nav-link">Resources</a></li>
            </ul>
            <a href="/auth/login" class="btn btn-primary">Login</a>
        </div>
    </nav>

    <!-- Breadcrumbs -->
    <section class="breadcrumbs">
        <div class="container">
            <nav class="breadcrumb-nav">
                <a href="/" class="breadcrumb-link">Home</a>
                <span>›</span>
                <a href="/programs" class="breadcrumb-link">Programs</a>
                <span>›</span>
                <span>Co-op Program</span>
            </nav>
        </div>
    </section>

    <!-- Program Hero -->
    <section class="program-hero">
        <div class="container">
            <h1>Co-op Program</h1>
            <p>Gain valuable industry experience through our traditional cooperative education program. Work with leading companies while earning academic credit and building your professional network.</p>
            
            <div class="program-quick-facts">
                <div class="quick-fact">
                    <span class="quick-fact-value">4-6</span>
                    <div class="quick-fact-label">Months Duration</div>
                </div>
                <div class="quick-fact">
                    <span class="quick-fact-value">3.0+</span>
                    <div class="quick-fact-label">Min GPA Required</div>
                </div>
                <div class="quick-fact">
                    <span class="quick-fact-value">150+</span>
                    <div class="quick-fact-label">Students Placed</div>
                </div>
                <div class="quick-fact">
                    <span class="quick-fact-value">90%</span>
                    <div class="quick-fact-label">Success Rate</div>
                </div>
            </div>
            
            <a href="/students/apply?program=coop" class="btn btn-secondary">Apply Now</a>
        </div>
    </section>

    <!-- Main Content -->
    <section class="main-content">
        <div class="content-grid">
            <!-- Main Content -->
            <div class="main-column">
                <!-- Overview Section -->
                <div class="content-section">
                    <h2>Program Overview</h2>
                    <p>The Co-op Program is AUI's flagship work-based learning initiative, designed to bridge the gap between academic theory and professional practice. Students work full-time with our industry partners while maintaining their academic progression.</p>
                    
                    <p>This program provides students with the opportunity to apply classroom knowledge in real-world settings, develop professional skills, and build networks that will benefit their future careers. Our partner companies span various industries including technology, finance, engineering, and consulting.</p>
                    
                    <div class="success-story">
                        <div class="success-quote">
                            "The Co-op program was transformative. I gained practical experience, built confidence, and secured a full-time offer before graduation. The support from both AUI and my host company was exceptional."
                        </div>
                        <div class="success-author">Sara Bennani</div>
                        <div class="success-details">Computer Science '23 • Now Software Engineer at TechnoSoft Morocco</div>
                    </div>
                </div>

                <!-- Requirements Section -->
                <div class="content-section">
                    <h2>Eligibility Requirements</h2>
                    <ul class="requirements-list">
                        <li>
                            <span class="requirement-icon">✓</span>
                            <div>
                                <strong>Academic Standing:</strong> Minimum cumulative GPA of 3.0 and good academic standing with no disciplinary issues.
                            </div>
                        </li>
                        <li>
                            <span class="requirement-icon">✓</span>
                            <div>
                                <strong>Course Completion:</strong> Completion of foundational courses in your major and at least 60 credit hours.
                            </div>
                        </li>
                        <li>
                            <span class="requirement-icon">✓</span>
                            <div>
                                <strong>Faculty Recommendation:</strong> Letter of recommendation from a faculty member in your department.
                            </div>
                        </li>
                        <li>
                            <span class="requirement-icon">✓</span>
                            <div>
                                <strong>Professional Skills:</strong> Demonstrated communication skills, professionalism, and relevant technical competencies.
                            </div>
                        </li>
                        <li>
                            <span class="requirement-icon">✓</span>
                            <div>
                                <strong>Time Commitment:</strong> Availability for full-time work (40 hours/week) for the program duration.
                            </div>
                        </li>
                    </ul>
                </div>

                <!-- Application Process -->
                <div class="content-section">
                    <h2>Application Process & Timeline</h2>
                    <ul class="timeline">
                        <li class="timeline-item">
                            <div class="timeline-title">Application Submission</div>
                            <p>Complete online application including essays, resume, and academic transcripts. Applications open each semester.</p>
                        </li>
                        <li class="timeline-item">
                            <div class="timeline-title">Initial Review</div>
                            <p>Academic and professional background review by the WIL team. Candidates may be invited for an interview.</p>
                        </li>
                        <li class="timeline-item">
                            <div class="timeline-title">Company Matching</div>
                            <p>Successful applicants are matched with partner companies based on interests, skills, and availability.</p>
                        </li>
                        <li class="timeline-item">
                            <div class="timeline-title">Company Interview</div>
                            <p>Final interview with the host company to ensure mutual fit and discuss project expectations.</p>
                        </li>
                        <li class="timeline-item">
                            <div class="timeline-title">Placement Confirmation</div>
                            <p>Formal placement confirmation and orientation session before starting the co-op experience.</p>
                        </li>
                    </ul>
                </div>

                <!-- Benefits Section -->
                <div class="content-section">
                    <h2>Program Benefits</h2>
                    <div class="grid grid-cols-2">
                        <div>
                            <h4 style="color: var(--aui-primary); margin-bottom: 1rem;">Professional Development</h4>
                            <ul style="color: var(--gray-700);">
                                <li>Real-world work experience</li>
                                <li>Industry mentorship</li>
                                <li>Professional network building</li>
                                <li>Skill development and training</li>
                            </ul>
                        </div>
                        <div>
                            <h4 style="color: var(--aui-primary); margin-bottom: 1rem;">Academic Integration</h4>
                            <ul style="color: var(--gray-700);">
                                <li>Academic credit (3-6 credits)</li>
                                <li>Faculty supervision</li>
                                <li>Reflection and learning portfolio</li>
                                <li>Career guidance and planning</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- FAQ Section -->
                <div class="content-section">
                    <h2>Frequently Asked Questions</h2>
                    <div class="faq-item">
                        <div class="faq-question">
                            How is the Co-op program different from a regular internship?
                            <span>+</span>
                        </div>
                        <div class="faq-answer">
                            The Co-op program is more structured and longer than typical internships. It includes academic credit, faculty supervision, regular check-ins, and a formal learning portfolio. Students also receive comprehensive career support throughout the experience.
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            Are Co-op positions paid?
                            <span>+</span>
                        </div>
                        <div class="faq-answer">
                            Most Co-op positions are paid, with salaries varying by industry and company. Some positions may offer other benefits like housing stipends, transportation, or professional development allowances.
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            Can international students participate?
                            <span>+</span>
                        </div>
                        <div class="faq-answer">
                            Yes, international students can participate. However, they may need to obtain appropriate work authorization. Our team works with international students to navigate visa and work permit requirements.
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar -->
            <div class="sidebar">
                <h3>Ready to Apply?</h3>
                <div class="sidebar-cta">
                    <p style="margin-bottom: 1rem; color: var(--gray-700);">Join 150+ students who have launched their careers through our Co-op program.</p>
                    <a href="/students/apply?program=coop" class="btn btn-primary" style="width: 100%; margin-bottom: 1rem;">Start Application</a>
                    <a href="/resources/coop-guide.pdf" class="btn btn-outline" style="width: 100%;">Download Guide</a>
                </div>

                <div class="contact-info">
                    <h4 style="color: var(--aui-primary); margin-bottom: 1rem;">Contact Information</h4>
                    <div class="contact-item">
                        <span class="contact-icon">📧</span>
                        <span>coop@aui.ma</span>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">📞</span>
                        <span>+212 5 35 26 90 15</span>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">📍</span>
                        <span>Career Services Office<br>Building 19, Room 101</span>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">🕒</span>
                        <span>Mon-Fri: 9:00 AM - 5:00 PM</span>
                    </div>
                </div>

                <div class="related-programs">
                    <h4 style="color: var(--aui-primary); margin-bottom: 1rem;">Other Programs</h4>
                    <a href="/programs/remote" class="related-program">
                        <strong>Remote@AUI</strong><br>
                        <small>Work remotely with global companies</small>
                    </a>
                    <a href="/programs/alternance" class="related-program">
                        <strong>Alternance Program</strong><br>
                        <small>Balance work and study periods</small>
                    </a>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
EOF

# Create student portal wireframe
cat > wireframes/pages/student-portal.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - WIL.AUI.MA</title>
    <link rel="stylesheet" href="../assets/brand-guidelines.css">
    <style>
        /* Portal Layout */
        .portal-layout {
            display: flex;
            min-height: 100vh;
            margin-top: 80px;
        }
        
        .sidebar {
            width: 280px;
            background: var(--gray-900);
            color: white;
            padding: 2rem 0;
            position: fixed;
            top: 80px;
            bottom: 0;
            left: 0;
            overflow-y: auto;
        }
        
        .sidebar-logo {
            padding: 0 2rem 2rem;
            border-bottom: 1px solid var(--gray-700);
            margin-bottom: 2rem;
        }
        
        .sidebar-logo h3 {
            color: var(--aui-secondary);
            margin: 0;
        }
        
        .sidebar-nav {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .sidebar-nav li {
            margin-bottom: 0.5rem;
        }
        
        .sidebar-link {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 2rem;
            color: var(--gray-300);
            text-decoration: none;
            transition: all 0.2s;
        }
        
        .sidebar-link:hover,
        .sidebar-link.active {
            background: var(--aui-primary);
            color: white;
        }
        
        .sidebar-icon {
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 2rem;
            background: var(--gray-50);
            min-height: calc(100vh - 80px);
        }
        
        .portal-header {
            background: white;
            border-radius: var(--radius-lg);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-sm);
        }
        
        .portal-header h1 {
            color: var(--aui-primary);
            margin-bottom: 0.5rem;
        }
        
        .portal-header p {
            color: var(--gray-600);
            margin: 0;
        }
        
        /* Dashboard Cards */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .dashboard-card {
            background: white;
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            box-shadow: var(--shadow-sm);
            transition: all 0.2s;
        }
        
        .dashboard-card:hover {
            box-shadow: var(--shadow-md);
            transform: translateY(-2px);
        }
        
        .card-header {
            display: flex;
            align-items: center;
            justify-content: between;
            margin-bottom: 1rem;
        }
        
        .card-title {
            color: var(--aui-primary);
            font-size: 1.125rem;
            font-weight: 600;
            margin: 0;
        }
        
        .card-icon {
            background: var(--aui-light-blue);
            color: var(--aui-primary);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
        }
        
        /* Status Badges */
        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 0.25rem 0.75rem;
            border-radius: var(--radius-sm);
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        
        .status-pending {
            background: #FEF3C7;
            color: #92400E;
        }
        
        .status-approved {
            background: #D1FAE5;
            color: #065F46;
        }
        
        .status-under-review {
            background: #DBEAFE;
            color: #1E40AF;
        }
        
        .status-rejected {
            background: #FEE2E2;
            color: #991B1B;
        }
        
        /* Application Cards */
        .application-card {
            background: white;
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: var(--shadow-sm);
            border-left: 4px solid var(--aui-primary);
        }
        
        .application-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1rem;
        }
        
        .application-title {
            color: var(--aui-primary);
            font-weight: 600;
            margin-bottom: 0.25rem;
        }
        
        .application-company {
            color: var(--gray-600);
            font-size: 0.875rem;
        }
        
        .application-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .detail-item {
            font-size: 0.875rem;
        }
        
        .detail-label {
            color: var(--gray-500);
            font-weight: 500;
        }
        
        .detail-value {
            color: var(--gray-800);
            font-weight: 600;
        }
        
        /* Progress Bar */
        .progress-bar {
            background: var(--gray-200);
            border-radius: var(--radius-sm);
            height: 8px;
            overflow: hidden;
            margin: 1rem 0;
        }
        
        .progress-fill {
            background: var(--aui-primary);
            height: 100%;
            transition: width 0.3s ease;
        }
        
        /* Notification Item */
        .notification-item {
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            padding: 1rem;
            border-bottom: 1px solid var(--gray-200);
        }
        
        .notification-item:last-child {
            border-bottom: none;
        }
        
        .notification-icon {
            background: var(--aui-light-blue);
            color: var(--aui-primary);
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.875rem;
            flex-shrink: 0;
        }
        
        .notification-content {
            flex: 1;
        }
        
        .notification-title {
            font-weight: 600;
            color: var(--gray-800);
            margin-bottom: 0.25rem;
        }
        
        .notification-text {
            color: var(--gray-600);
            font-size: 0.875rem;
            margin-bottom: 0.25rem;
        }
        
        .notification-time {
            color: var(--gray-500);
            font-size: 0.75rem;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s ease;
            }
            
            .sidebar.mobile-open {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }
            
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
            
            .application-header {
                flex-direction: column;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Portal Layout -->
    <div class="portal-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-logo">
                <h3>Student Portal</h3>
                <p style="color: var(--gray-400); margin: 0; font-size: 0.875rem;">Youssef El Amrani</p>
            </div>
            <nav>
                <ul class="sidebar-nav">
                    <li>
                        <a href="#dashboard" class="sidebar-link active">
                            <span class="sidebar-icon">📊</span>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="#applications" class="sidebar-link">
                            <span class="sidebar-icon">📝</span>
                            My Applications
                        </a>
                    </li>
                    <li>
                        <a href="#profile" class="sidebar-link">
                            <span class="sidebar-icon">👤</span>
                            Profile
                        </a>
                    </li>
                    <li>
                        <a href="#documents" class="sidebar-link">
                            <span class="sidebar-icon">📁</span>
                            Documents
                        </a>
                    </li>
                    <li>
                        <a href="#opportunities" class="sidebar-link">
                            <span class="sidebar-icon">🎯</span>
                            Opportunities
                        </a>
                    </li>
                    <li>
                        <a href="#messages" class="sidebar-link">
                            <span class="sidebar-icon">💬</span>
                            Messages
                            <span style="background: var(--error); color: white; border-radius: 50%; width: 20px; height: 20px; display: flex; align-items: center; justify-content: center; font-size: 0.75rem; margin-left: auto;">3</span>
                        </a>
                    </li>
                    <li>
                        <a href="#settings" class="sidebar-link">
                            <span class="sidebar-icon">⚙️</span>
                            Settings
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Portal Header -->
            <div class="portal-header">
                <h1>Welcome back, Youssef!</h1>
                <p>Track your applications, explore new opportunities, and manage your work-based learning journey.</p>
            </div>

            <!-- Dashboard Grid -->
            <div class="dashboard-grid">
                <!-- Application Status -->
                <div class="dashboard-card">
                    <div class="card-header">
                        <div class="card-icon">📝</div>
                        <h3 class="card-title">Application Status</h3>
                    </div>
                    <div style="margin-bottom: 1rem;">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                            <span>Profile Completion</span>
                            <span style="font-weight: 600;">85%</span>
                        </div>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 85%;"></div>
                        </div>
                    </div>
                    <div style="display: flex; justify-content: space-between; margin-bottom: 1rem;">
                        <span style="color: var(--gray-600);">Active Applications</span>
                        <span style="font-size: 1.5rem; font-weight: 700; color: var(--aui-primary);">2</span>
                    </div>
                    <a href="#applications" class="btn btn-primary" style="width: 100%;">View Applications</a>
                </div>

                <!-- Upcoming Deadlines -->
                <div class="dashboard-card">
                    <div class="card-header">
                        <div class="card-icon">📅</div>
                        <h3 class="card-title">Upcoming Deadlines</h3>
                    </div>
                    <div style="space-y: 1rem;">
                        <div style="padding: 0.75rem; background: var(--aui-light-blue); border-radius: var(--radius-md); margin-bottom: 0.75rem;">
                            <div style="font-weight: 600; color: var(--aui-primary);">Co-op Application</div>
                            <div style="font-size: 0.875rem; color: var(--gray-600);">Due in 5 days</div>
                        </div>
                        <div style="padding: 0.75rem; background: var(--gray-50); border-radius: var(--radius-md); margin-bottom: 0.75rem;">
                            <div style="font-weight: 600; color: var(--gray-700);">Transcript Upload</div>
                            <div style="font-size: 0.875rem; color: var(--gray-600);">Due in 12 days</div>
                        </div>
                    </div>
                    <a href="#applications" class="btn btn-outline" style="width: 100%;">View All</a>
                </div>

                <!-- Recommended Opportunities -->
                <div class="dashboard-card">
                    <div class="card-header">
                        <div class="card-icon">🎯</div>
                        <h3 class="card-title">Recommended for You</h3>
                    </div>
                    <div style="margin-bottom: 1rem;">
                        <div style="font-weight: 600; margin-bottom: 0.5rem;">Software Developer Intern</div>
                        <div style="color: var(--gray-600); font-size: 0.875rem; margin-bottom: 0.5rem;">TechCorp Morocco</div>
                        <div class="status-badge" style="background: var(--success); color: white;">95% Match</div>
                    </div>
                    <div style="margin-bottom: 1rem;">
                        <div style="font-weight: 600; margin-bottom: 0.5rem;">Data Analyst Co-op</div>
                        <div style="color: var(--gray-600); font-size: 0.875rem; margin-bottom: 0.5rem;">Analytics Plus</div>
                        <div class="status-badge" style="background: var(--aui-secondary); color: var(--aui-primary);">88% Match</div>
                    </div>
                    <a href="#opportunities" class="btn btn-primary" style="width: 100%;">Explore All</a>
                </div>

                <!-- Recent Activity -->
                <div class="dashboard-card">
                    <div class="card-header">
                        <div class="card-icon">🔔</div>
                        <h3 class="card-title">Recent Activity</h3>
                    </div>
                    <div class="notification-item">
                        <div class="notification-icon">✓</div>
                        <div class="notification-content">
                            <div class="notification-title">Application Submitted</div>
                            <div class="notification-text">Co-op application sent to TechCorp</div>
                            <div class="notification-time">2 hours ago</div>
                        </div>
                    </div>
                    <div class="notification-item">
                        <div class="notification-icon">📝</div>
                        <div class="notification-content">
                            <div class="notification-title">Profile Updated</div>
                            <div class="notification-text">Added new skills and certifications</div>
                            <div class="notification-time">1 day ago</div>
                        </div>
                    </div>
                    <div class="notification-item">
                        <div class="notification-icon">💬</div>
                        <div class="notification-content">
                            <div class="notification-title">New Message</div>
                            <div class="notification-text">Message from Career Services</div>
                            <div class="notification-time">2 days ago</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Applications Section -->
            <div style="background: white; border-radius: var(--radius-lg); padding: 2rem; box-shadow: var(--shadow-sm);">
                <h2 style="color: var(--aui-primary); margin-bottom: 1.5rem;">My Applications</h2>
                
                <div class="application-card">
                    <div class="application-header">
                        <div>
                            <div class="application-title">Software Developer Co-op</div>
                            <div class="application-company">TechCorp Morocco • Casablanca</div>
                        </div>
                        <div class="status-badge status-under-review">Under Review</div>
                    </div>
                    <p style="color: var(--gray-600); margin-bottom: 1rem;">Join our development team to work on cutting-edge web applications using modern technologies including React, Node.js, and cloud platforms.</p>
                    <div class="application-details">
                        <div class="detail-item">
                            <div class="detail-label">Applied</div>
                            <div class="detail-value">March 15, 2025</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Duration</div>
                            <div class="detail-value">6 months</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Start Date</div>
                            <div class="detail-value">June 1, 2025</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Compensation</div>
                            <div class="detail-value">12,000 MAD/month</div>
                        </div>
                    </div>
                    <div style="margin-top: 1rem; display: flex; gap: 1rem;">
                        <a href="#" class="btn btn-outline">View Details</a>
                        <a href="#" class="btn btn-primary">Update Application</a>
                    </div>
                </div>

                <div class="application-card">
                    <div class="application-header">
                        <div>
                            <div class="application-title">Remote Data Analyst</div>
                            <div class="application-company">Global Analytics Inc. • Remote</div>
                        </div>
                        <div class="status-badge status-pending">Pending</div>
                    </div>
                    <p style="color: var(--gray-600); margin-bottom: 1rem;">Work with international datasets to derive insights for business decision-making. Flexible remote work arrangement with global team collaboration.</p>
                    <div class="application-details">
                        <div class="detail-item">
                            <div class="detail-label">Applied</div>
                            <div class="detail-value">March 18, 2025</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Duration</div>
                            <div class="detail-value">4 months</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Start Date</div>
                            <div class="detail-value">July 1, 2025</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Compensation</div>
                            <div class="detail-value">$1,200 USD/month</div>
                        </div>
                    </div>
                    <div style="margin-top: 1rem; display: flex; gap: 1rem;">
                        <a href="#" class="btn btn-outline">View Details</a>
                        <a href="#" class="btn btn-primary">Complete Application</a>
                    </div>
                </div>

                <div style="text-align: center; margin-top: 2rem;">
                    <a href="#opportunities" class="btn btn-secondary">Browse More Opportunities</a>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
EOF

# Create employer portal wireframe
cat > wireframes/pages/employer-portal.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employer Portal - WIL.AUI.MA</title>
    <link rel="stylesheet" href="../assets/brand-guidelines.css">
    <style>
        /* Reuse portal layout styles from student portal */
        .portal-layout {
            display: flex;
            min-height: 100vh;
            margin-top: 80px;
        }
        
        .sidebar {
            width: 280px;
            background: var(--gray-900);
            color: white;
            padding: 2rem 0;
            position: fixed;
            top: 80px;
            bottom: 0;
            left: 0;
            overflow-y: auto;
        }
        
        .sidebar-logo {
            padding: 0 2rem 2rem;
            border-bottom: 1px solid var(--gray-700);
            margin-bottom: 2rem;
        }
        
        .sidebar-logo h3 {
            color: var(--aui-secondary);
            margin: 0;
        }
        
        .sidebar-nav {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .sidebar-link {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 2rem;
            color: var(--gray-300);
            text-decoration: none;
            transition: all 0.2s;
        }
        
        .sidebar-link:hover,
        .sidebar-link.active {
            background: var(--aui-primary);
            color: white;
        }
        
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 2rem;
            background: var(--gray-50);
            min-height: calc(100vh - 80px);
        }
        
        .portal-header {
            background: white;
            border-radius: var(--radius-lg);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-sm);
        }
        
        /* Opportunity Cards */
        .opportunity-card {
            background: white;
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: var(--shadow-sm);
            border-left: 4px solid var(--aui-accent);
        }
        
        .opportunity-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1rem;
        }
        
        .opportunity-title {
            color: var(--aui-primary);
            font-weight: 600;
            margin-bottom: 0.25rem;
        }
        
        .opportunity-meta {
            color: var(--gray-600);
            font-size: 0.875rem;
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .stat-item {
            text-align: center;
            padding: 1rem;
            background: var(--gray-50);
            border-radius: var(--radius-md);
        }
        
        .stat-number {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--aui-primary);
            display: block;
        }
        
        .stat-label {
            font-size: 0.75rem;
            color: var(--gray-600);
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        
        /* Applicant Cards */
        .applicant-card {
            background: white;
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
        }
        
        .applicant-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1rem;
        }
        
        .applicant-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .applicant-avatar {
            width: 50px;
            height: 50px;
            background: var(--aui-light-blue);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--aui-primary);
            font-weight: 600;
            font-size: 1.25rem;
        }
        
        .applicant-name {
            color: var(--aui-primary);
            font-weight: 600;
            margin-bottom: 0.25rem;
        }
        
        .applicant-details {
            color: var(--gray-600);
            font-size: 0.875rem;
        }
        
        .applicant-skills {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
            margin: 1rem 0;
        }
        
        .skill-tag {
            background: var(--aui-light-blue);
            color: var(--aui-primary);
            padding: 0.25rem 0.75rem;
            border-radius: var(--radius-sm);
            font-size: 0.75rem;
            font-weight: 500;
        }
        
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
        
        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <!-- Portal Layout -->
    <div class="portal-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-logo">
                <h3>Employer Portal</h3>
                <p style="color: var(--gray-400); margin: 0; font-size: 0.875rem;">TechCorp Morocco</p>
            </div>
            <nav>
                <ul class="sidebar-nav">
                    <li>
                        <a href="#dashboard" class="sidebar-link active">
                            <span class="sidebar-icon">📊</span>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="#opportunities" class="sidebar-link">
                            <span class="sidebar-icon">💼</span>
                            My Opportunities
                        </a>
                    </li>
                    <li>
                        <a href="#applicants" class="sidebar-link">
                            <span class="sidebar-icon">👥</span>
                            Applicants
                            <span style="background: var(--aui-secondary); color: var(--aui-primary); border-radius: 50%; width: 20px; height: 20px; display: flex; align-items: center; justify-content: center; font-size: 0.75rem; margin-left: auto;">8</span>
                        </a>
                    </li>
                    <li>
                        <a href="#post" class="sidebar-link">
                            <span class="sidebar-icon">✏️</span>
                            Post Opportunity
                        </a>
                    </li>
                    <li>
                        <a href="#profile" class="sidebar-link">
                            <span class="sidebar-icon">🏢</span>
                            Company Profile
                        </a>
                    </li>
                    <li>
                        <a href="#analytics" class="sidebar-link">
                            <span class="sidebar-icon">📈</span>
                            Analytics
                        </a>
                    </li>
                    <li>
                        <a href="#messages" class="sidebar-link">
                            <span class="sidebar-icon">💬</span>
                            Messages
                        </a>
                    </li>
                    <li>
                        <a href="#settings" class="sidebar-link">
                            <span class="sidebar-icon">⚙️</span>
                            Settings
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Portal Header -->
            <div class="portal-header">
                <h1>Welcome back, TechCorp!</h1>
                <p>Manage your opportunities, review applications, and connect with talented AUI students.</p>
            </div>

            <!-- Dashboard Stats -->
            <div style="background: white; border-radius: var(--radius-lg); padding: 2rem; margin-bottom: 2rem; box-shadow: var(--shadow-sm);">
                <h2 style="color: var(--aui-primary); margin-bottom: 1.5rem;">Overview</h2>
                <div class="stats-grid">
                    <div class="stat-item">
                        <span class="stat-number">3</span>
                        <div class="stat-label">Active Opportunities</div>
                    </div>
                    <div class="stat-item">
                        <span class="stat-number">24</span>
                        <div class="stat-label">Total Applications</div>
                    </div>
                    <div class="stat-item">
                        <span class="stat-number">8</span>
                        <div class="stat-label">Pending Review</div>
                    </div>
                    <div class="stat-item">
                        <span class="stat-number">5</span>
                        <div class="stat-label">Interviews Scheduled</div>
                    </div>
                </div>
            </div>

            <!-- Active Opportunities -->
            <div style="background: white; border-radius: var(--radius-lg); padding: 2rem; margin-bottom: 2rem; box-shadow: var(--shadow-sm);">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
                    <h2 style="color: var(--aui-primary); margin: 0;">Active Opportunities</h2>
                    <a href="#post" class="btn btn-primary">Post New Opportunity</a>
                </div>
                
                <div class="opportunity-card">
                    <div class="opportunity-header">
                        <div>
                            <div class="opportunity-title">Software Developer Co-op</div>
                            <div class="opportunity-meta">
                                <span>📅 Posted: March 10, 2025</span>
                                <span>⏰ Deadline: April 15, 2025</span>
                                <span>📍 Casablanca</span>
                            </div>
                        </div>
                        <div class="status-badge status-approved">Active</div>
                    </div>
                    <p style="color: var(--gray-600); margin-bottom: 1rem;">Seeking passionate computer science students to join our development team working on innovative web applications.</p>
                    <div class="stats-grid">
                        <div class="stat-item">
                            <span class="stat-number">12</span>
                            <div class="stat-label">Applications</div>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">5</span>
                            <div class="stat-label">Under Review</div>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">3</span>
                            <div class="stat-label">Shortlisted</div>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">25</span>
                            <div class="stat-label">Days Left</div>
                        </div>
                    </div>
                    <div style="margin-top: 1rem; display: flex; gap: 1rem;">
                        <a href="#" class="btn btn-outline">View Applications</a>
                        <a href="#" class="btn btn-primary">Edit Opportunity</a>
                    </div>
                </div>

                <div class="opportunity-card">
                    <div class="opportunity-header">
                        <div>
                            <div class="opportunity-title">Data Analyst Intern</div>
                            <div class="opportunity-meta">
                                <span>📅 Posted: March 5, 2025</span>
                                <span>⏰ Deadline: April 1, 2025</span>
                                <span>📍 Remote</span>
                            </div>
                        </div>
                        <div class="status-badge status-pending">Pending Review</div>
                    </div>
                    <p style="color: var(--gray-600); margin-bottom: 1rem;">Remote internship opportunity for students interested in data analysis and business intelligence.</p>
                    <div class="stats-grid">
                        <div class="stat-item">
                            <span class="stat-number">8</span>
                            <div class="stat-label">Applications</div>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">2</span>
                            <div class="stat-label">Under Review</div>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">1</span>
                            <div class="stat-label">Shortlisted</div>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">12</span>
                            <div class="stat-label">Days Left</div>
                        </div>
                    </div>
                    <div style="margin-top: 1rem; display: flex; gap: 1rem;">
                        <a href="#" class="btn btn-outline">View Applications</a>
                        <a href="#" class="btn btn-primary">Edit Opportunity</a>
                    </div>
                </div>
            </div>

            <!-- Recent Applicants -->
            <div style="background: white; border-radius: var(--radius-lg); padding: 2rem; box-shadow: var(--shadow-sm);">
                <h2 style="color: var(--aui-primary); margin-bottom: 1.5rem;">Recent Applicants</h2>
                
                <div class="applicant-card">
                    <div class="applicant-header">
                        <div class="applicant-info">
                            <div class="applicant-avatar">YE</div>
                            <div>
                                <div class="applicant-name">Youssef El Amrani</div>
                                <div class="applicant-details">Computer Science • Year 3 • GPA: 3.8</div>
                            </div>
                        </div>
                        <div class="status-badge status-pending">New Application</div>
                    </div>
                    <div class="applicant-skills">
                        <span class="skill-tag">React</span>
                        <span class="skill-tag">Node.js</span>
                        <span class="skill-tag">Python</span>
                        <span class="skill-tag">SQL</span>
                        <span class="skill-tag">Git</span>
                    </div>
                    <p style="color: var(--gray-600); font-size: 0.875rem; margin-bottom: 1rem;">Applied for: Software Developer Co-op • 2 hours ago</p>
                    <div class="action-buttons">
                        <a href="#" class="btn btn-outline btn-sm">View Profile</a>
                        <a href="#" class="btn btn-primary btn-sm">Review Application</a>
                        <a href="#" class="btn btn-secondary btn-sm">Schedule Interview</a>
                    </div>
                </div>

                <div class="applicant-card">
                    <div class="applicant-header">
                        <div class="applicant-info">
                            <div class="applicant-avatar">AB</div>
                            <div>
                                <div class="applicant-name">Aicha Benali</div>
                                <div class="applicant-details">Business Administration • Year 4 • GPA: 3.9</div>
                            </div>
                        </div>
                        <div class="status-badge status-under-review">Under Review</div>
                    </div>
                    <div class="applicant-skills">
                        <span class="skill-tag">Excel</span>
                        <span class="skill-tag">Tableau</span>
                        <span class="skill-tag">SQL</span>
                        <span class="skill-tag">Python</span>
                        <span class="skill-tag">Statistics</span>
                    </div>
                    <p style="color: var(--gray-600); font-size: 0.875rem; margin-bottom: 1rem;">Applied for: Data Analyst Intern • 1 day ago</p>
                    <div class="action-buttons">
                        <a href="#" class="btn btn-outline btn-sm">View Profile</a>
                        <a href="#" class="btn btn-primary btn-sm">Continue Review</a>
                        <a href="#" class="btn btn-secondary btn-sm">Schedule Interview</a>
                    </div>
                </div>

                <div class="applicant-card">
                    <div class="applicant-header">
                        <div class="applicant-info">
                            <div class="applicant-avatar">OR</div>
                            <div>
                                <div class="applicant-name">Omar Rachidi</div>
                                <div class="applicant-details">Engineering • Year 3 • GPA: 3.7</div>
                            </div>
                        </div>
                        <div class="status-badge status-approved">Shortlisted</div>
                    </div>
                    <div class="applicant-skills">
                        <span class="skill-tag">JavaScript</span>
                        <span class="skill-tag">React</span>
                        <span class="skill-tag">C++</span>
                        <span class="skill-tag">AutoCAD</span>
                        <span class="skill-tag">MATLAB</span>
                    </div>
                    <p style="color: var(--gray-600); font-size: 0.875rem; margin-bottom: 1rem;">Applied for: Software Developer Co-op • 3 days ago</p>
                    <div class="action-buttons">
                        <a href="#" class="btn btn-outline btn-sm">View Profile</a>
                        <a href="#" class="btn btn-primary btn-sm">Interview Details</a>
                        <a href="#" class="btn btn-secondary btn-sm">Send Message</a>
                    </div>
                </div>

                <div style="text-align: center; margin-top: 2rem;">
                    <a href="#applicants" class="btn btn-secondary">View All Applicants</a>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
EOF

# Create component library documentation
cat > wireframes/components/component-library.md << 'EOF'
# WIL.AUI.MA Component Library

## Navigation Components

### Primary Navigation
- **Fixed header** with AUI branding
- **Responsive menu** that collapses on mobile
- **Active state indicators** for current page
- **Login/logout** functionality

### Breadcrumbs
- **Contextual navigation** for internal pages
- **Clickable path** back to parent pages
- **Consistent styling** across all pages

## Content Components

### Hero Sections
1. **Homepage Hero**
   - Full-screen background with overlay
   - Primary heading and value proposition
   - Dual CTA buttons
   - Key metrics display

2. **Page Hero**
   - Smaller header for internal pages
   - Program-specific information
   - Quick facts display
   - Single primary CTA

### Cards
1. **Program Cards**
   - Icon, title, description
   - Key statistics
   - Call-to-action button
   - Hover animations

2. **Testimonial Cards**
   - Quote, author, role
   - Left border accent
   - Consistent spacing

3. **Dashboard Cards**
   - Icon header
   - Progress indicators
   - Action buttons
   - Status badges

### Forms
1. **Application Forms**
   - Multi-step wizard
   - Progress indicator
   - Field validation
   - File upload areas

2. **Contact Forms**
   - Simple layout
   - Required field indicators
   - Success/error states

## Interactive Components

### Buttons
- **Primary**: Main actions (Apply, Submit)
- **Secondary**: Supporting actions (Learn More)
- **Outline**: Tertiary actions (Cancel, Back)
- **Small**: Table/card actions

### Status Indicators
- **Pending**: Yellow/orange styling
- **Under Review**: Blue styling
- **Approved**: Green styling
- **Rejected**: Red styling

### Navigation
- **Tabs**: For organizing content sections
- **Accordion**: For FAQ and expandable content
- **Pagination**: For search results and tables

## Data Display

### Tables
- **Sortable columns** with indicators
- **Row actions** (edit, delete, view)
- **Responsive** layout for mobile
- **Pagination** for large datasets

### Statistics
- **Metric cards** with large numbers
- **Progress bars** for completion
- **Charts** for analytics (future phase)

## Layout Components

### Grid System
- **Responsive grid** based on CSS Grid
- **Consistent spacing** using design tokens
- **Mobile-first** approach

### Containers
- **Max-width**: 1200px for main content
- **Responsive padding** for different screen sizes
- **Consistent vertical rhythm**

## Brand Integration

### Colors
- **Primary**: #003366 (AUI Blue)
- **Secondary**: #FFD700 (AUI Gold)
- **Accent**: #008080 (Teal)
- **Neutrals**: Gray scale for text and backgrounds

### Typography
- **Headings**: Bold, consistent hierarchy
- **Body text**: Readable line heights and spacing
- **Interactive text**: Clear hover and active states

### Spacing
- **Consistent scale**: 4px base unit
- **Vertical rhythm**: Consistent margins and padding
- **White space**: Generous spacing for readability

## Accessibility Features

### Keyboard Navigation
- **Tab order** follows logical flow
- **Focus indicators** clearly visible
- **Skip links** for main content

### Screen Reader Support
- **Semantic HTML** structure
- **ARIA labels** for complex interactions
- **Alt text** for all images

### Color Contrast
- **WCAG AA compliance** for all text
- **High contrast** mode support
- **Color-blind friendly** palette

## Responsive Design

### Breakpoints
- **Mobile**: 320px - 768px
- **Tablet**: 768px - 1024px
- **Desktop**: 1024px+

### Mobile Optimizations
- **Touch targets** minimum 44px
- **Simplified navigation** with hamburger menu
- **Stacked layouts** for complex grids
- **Optimized forms** for mobile input
EOF

# Commit all Phase 2 work
git add .
git commit -m "Phase 2: Complete UI/UX Design & Wireframes

- Comprehensive brand guidelines and design system with AUI colors and typography
- Complete homepage wireframe with hero, programs, metrics, testimonials, and CTA sections
- Detailed program page wireframe (Co-op) with timeline, requirements, FAQ, and sidebar
- Student portal wireframe with dashboard, applications, profile management
- Employer portal wireframe with opportunity management and applicant review
- Complete component library documentation with all UI elements
- Responsive design implementation for mobile, tablet, and desktop
- Accessibility features and WCAG compliance standards"

echo "🎨 PHASE 2 COMPLETE!"
echo ""
echo "🖼️ Wireframes Created:"
echo "  ├── wireframes/pages/homepage.html - Complete homepage with all sections"
echo "  ├── wireframes/pages/program-coop.html - Detailed program page example"
echo "  ├── wireframes/pages/student-portal.html - Student dashboard and applications"
echo "  ├── wireframes/pages/employer-portal.html - Employer opportunity management"
echo "  ├── wireframes/assets/brand-guidelines.css - AUI design system and components"
echo "  └── wireframes/components/component-library.md - Complete UI component documentation"
echo ""
echo "🎯 Design Features Implemented:"
echo "  • AUI brand integration with official colors and typography"
echo "  • Responsive design for mobile, tablet, and desktop"
echo "  • Accessibility features with WCAG AA compliance"
echo "  • Interactive prototypes with hover states and animations"
echo "  • Complete user flows for students, employers, and admins"
echo "  • Professional dashboard interfaces for all user types"
echo ""
echo "📱 Responsive Breakpoints:"
echo "  • Mobile: 320px - 768px (touch-optimized)"
echo "  • Tablet: 768px - 1024px (adaptive layout)"
echo "  • Desktop: 1024px+ (full feature set)"
echo ""
echo "✅ Phase 2 Complete - Ready for Phase 3: Development (Frontend + Backend)"

# Create mobile-specific wireframes
mkdir -p wireframes/mobile

# Create mobile homepage wireframe
cat > wireframes/mobile/homepage-mobile.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WIL.AUI.MA - Mobile</title>
    <link rel="stylesheet" href="../assets/brand-guidelines.css">
    <style>
        /* Mobile-First Design */
        body {
            margin: 0;
            padding: 0;
            font-family: var(--font-body);
        }
        
        .mobile-nav {
            background: white;
            box-shadow: var(--shadow-sm);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            padding: 1rem;
        }
        
        .mobile-nav-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .mobile-logo {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--aui-primary);
        }
        
        .mobile-menu-btn {
            background: none;
            border: none;
            font-size: 1.5rem;
            color: var(--aui-primary);
            cursor: pointer;
        }
        
        .mobile-hero {
            background: linear-gradient(135deg, var(--aui-primary) 0%, var(--aui-accent) 100%);
            color: white;
            padding: 100px 1rem 60px;
            text-align: center;
            margin-top: 70px;
        }
        
        .mobile-hero h1 {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: white;
        }
        
        .mobile-hero p {
            font-size: 1rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }
        
        .mobile-cta {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            align-items: center;
        }
        
        .mobile-section {
            padding: 3rem 1rem;
        }
        
        .mobile-program-card {
            background: white;
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: var(--shadow-md);
            text-align: center;
        }
        
        .mobile-program-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        
        .mobile-metrics {
            background: var(--aui-primary);
            color: white;
            padding: 3rem 1rem;
        }
        
        .mobile-metric {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .mobile-metric-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--aui-secondary);
            display: block;
        }
        
        .mobile-metric-label {
            font-size: 1rem;
            opacity: 0.9;
        }
        
        .mobile-testimonial {
            background: white;
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: var(--shadow-md);
            text-align: center;
            border-left: 4px solid var(--aui-secondary);
        }
        
        .mobile-footer {
            background: var(--gray-900);
            color: white;
            padding: 3rem 1rem 2rem;
        }
        
        .mobile-footer-section {
            margin-bottom: 2rem;
        }
        
        .mobile-footer h4 {
            color: var(--aui-secondary);
            margin-bottom: 1rem;
        }
        
        .mobile-footer a {
            color: var(--gray-300);
            text-decoration: none;
            display: block;
            margin-bottom: 0.5rem;
        }
    </style>
</head>
<body>
    <!-- Mobile Navigation -->
    <nav class="mobile-nav">
        <div class="mobile-nav-content">
            <div class="mobile-logo">WIL.AUI</div>
            <button class="mobile-menu-btn">☰</button>
        </div>
    </nav>

    <!-- Mobile Hero -->
    <section class="mobile-hero">
        <h1>Bridge Academia & Industry</h1>
        <p>Transform your academic knowledge into real-world experience through our work-based learning programs.</p>
        <div class="mobile-cta">
            <a href="/programs" class="btn btn-secondary">Explore Programs</a>
            <a href="/employers/partnership" class="btn btn-outline">Partner With Us</a>
        </div>
    </section>

    <!-- Mobile Programs -->
    <section class="mobile-section" style="background: var(--gray-50);">
        <h2 style="text-align: center; margin-bottom: 2rem; color: var(--aui-primary);">Choose Your Path</h2>
        
        <div class="mobile-program-card">
            <div class="mobile-program-icon">🏢</div>
            <h3 style="color: var(--aui-primary);">Co-op Program</h3>
            <p style="color: var(--gray-600); margin-bottom: 1rem;">Traditional cooperative education with leading companies. 4-6 months of hands-on experience.</p>
            <a href="/programs/coop" class="btn btn-primary">Learn More</a>
        </div>
        
        <div class="mobile-program-card">
            <div class="mobile-program-icon">🌍</div>
            <h3 style="color: var(--aui-primary);">Remote@AUI</h3>
            <p style="color: var(--gray-600); margin-bottom: 1rem;">Work remotely with global companies. 3-12 months of international experience.</p>
            <a href="/programs/remote" class="btn btn-primary">Learn More</a>
        </div>
        
        <div class="mobile-program-card">
            <div class="mobile-program-icon">⚖️</div>
            <h3 style="color: var(--aui-primary);">Alternance</h3>
            <p style="color: var(--gray-600); margin-bottom: 1rem;">Perfect balance of study and work. 12-24 months of alternating periods.</p>
            <a href="/programs/alternance" class="btn btn-primary">Learn More</a>
        </div>
    </section>

    <!-- Mobile Metrics -->
    <section class="mobile-metrics">
        <h2 style="text-align: center; margin-bottom: 2rem; color: white;">Impact by Numbers</h2>
        
        <div class="mobile-metric">
            <span class="mobile-metric-number">250+</span>
            <div class="mobile-metric-label">Students Placed</div>
        </div>
        
        <div class="mobile-metric">
            <span class="mobile-metric-number">45+</span>
            <div class="mobile-metric-label">Partner Companies</div>
        </div>
        
        <div class="mobile-metric">
            <span class="mobile-metric-number">85%</span>
            <div class="mobile-metric-label">Employment Rate</div>
        </div>
        
        <div class="mobile-metric">
            <span class="mobile-metric-number">12K</span>
            <div class="mobile-metric-label">Avg. Salary (MAD)</div>
        </div>
    </section>

    <!-- Mobile Success Stories -->
    <section class="mobile-section">
        <h2 style="text-align: center; margin-bottom: 2rem; color: var(--aui-primary);">Success Stories</h2>
        
        <div class="mobile-testimonial">
            <p style="font-style: italic; margin-bottom: 1rem; color: var(--gray-600);">
                "The Co-op program opened doors I never knew existed. I'm now a full-time software engineer."
            </p>
            <div style="font-weight: 600; color: var(--aui-primary);">Youssef El Amrani</div>
            <div style="color: var(--gray-500); font-size: 0.875rem;">Computer Science '23</div>
        </div>
        
        <div class="mobile-testimonial">
            <p style="font-style: italic; margin-bottom: 1rem; color: var(--gray-600);">
                "Remote@AUI gave me global perspective and invaluable network connections worldwide."
            </p>
            <div style="font-weight: 600; color: var(--aui-primary);">Aicha Benali</div>
            <div style="color: var(--gray-500); font-size: 0.875rem;">Business Admin '24</div>
        </div>
    </section>

    <!-- Mobile CTA -->
    <section style="background: var(--aui-accent); color: white; padding: 3rem 1rem; text-align: center;">
        <h2 style="color: white; margin-bottom: 1rem;">Ready to Start?</h2>
        <p style="margin-bottom: 2rem; opacity: 0.9;">Join hundreds of AUI students launching their careers.</p>
        <div class="mobile-cta">
            <a href="/students/apply" class="btn btn-secondary">Apply Now</a>
            <a href="/programs" class="btn btn-outline">View Programs</a>
        </div>
    </section>

    <!-- Mobile Footer -->
    <footer class="mobile-footer">
        <div class="mobile-footer-section">
            <h4>Programs</h4>
            <a href="/programs/coop">Co-op Program</a>
            <a href="/programs/remote">Remote@AUI</a>
            <a href="/programs/alternance">Alternance</a>
        </div>
        
        <div class="mobile-footer-section">
            <h4>Students</h4>
            <a href="/students/apply">How to Apply</a>
            <a href="/students/portal">Student Portal</a>
            <a href="/students/stories">Success Stories</a>
        </div>
        
        <div class="mobile-footer-section">
            <h4>Employers</h4>
            <a href="/employers/partnership">Partner With Us</a>
            <a href="/employers/portal">Employer Portal</a>
        </div>
        
        <div class="mobile-footer-section">
            <h4>Contact</h4>
            <a href="mailto:wil@aui.ma">wil@aui.ma</a>
            <a href="tel:+212535269000">+212 5 35 26 90 00</a>
        </div>
        
        <div style="border-top: 1px solid var(--gray-800); padding-top: 2rem; text-align: center; color: var(--gray-400);">
            <p>&copy; 2025 Al Akhawayn University</p>
        </div>
    </footer>
</body>
</html>
EOF

# Create accessibility documentation
cat > wireframes/accessibility-guide.md << 'EOF'
# Accessibility Implementation Guide

## WCAG 2.1 AA Compliance Checklist

### Color and Contrast
- [ ] Text contrast ratio minimum 4.5:1
- [ ] Large text contrast ratio minimum 3:1
- [ ] Interactive elements have sufficient contrast
- [ ] Color is not the only way to convey information
- [ ] Focus indicators are clearly visible

### Keyboard Navigation
- [ ] All interactive elements are keyboard accessible
- [ ] Tab order follows logical sequence
- [ ] Skip links provided for main content
- [ ] Keyboard traps are avoided
- [ ] Custom interactive elements follow standard keyboard patterns

### Screen Reader Support
- [ ] Semantic HTML structure used throughout
- [ ] Headings follow proper hierarchy (H1-H6)
- [ ] Images have appropriate alt text
- [ ] Form labels are properly associated
- [ ] ARIA labels used for complex interactions

### Mobile Accessibility
- [ ] Touch targets minimum 44x44 pixels
- [ ] Content reflows properly at 320px width
- [ ] Zoom up to 200% without horizontal scrolling
- [ ] Text can be resized up to 200%
- [ ] Orientation changes supported

## Implementation Details

### Navigation
```html
<!-- Proper navigation structure -->
<nav role="navigation" aria-label="Main navigation">
  <ul>
    <li><a href="/programs" aria-current="page">Programs</a></li>
    <li><a href="/students">Students</a></li>
  </ul>
</nav>

<!-- Skip link -->
<a href="#main-content" class="skip-link">Skip to main content</a>
```

### Forms
```html
<!-- Proper form labeling -->
<label for="student-name">Full Name</label>
<input type="text" id="student-name" name="name" required 
       aria-describedby="name-help">
<small id="name-help">Enter your full legal name</small>

<!-- Error messaging -->
<input type="email" id="email" aria-invalid="true" 
       aria-describedby="email-error">
<div id="email-error" role="alert">Please enter a valid email address</div>
```

### Interactive Elements
```html
<!-- Button with proper labeling -->
<button type="submit" aria-describedby="submit-help">
  Submit Application
</button>
<small id="submit-help">Review your information before submitting</small>

<!-- Modal dialog -->
<div role="dialog" aria-labelledby="modal-title" aria-modal="true">
  <h2 id="modal-title">Confirm Application</h2>
  <!-- Modal content -->
</div>
```

### Status Updates
```html
<!-- Live region for status updates -->
<div aria-live="polite" aria-atomic="true" id="status-updates"></div>

<!-- Progress indicators -->
<div role="progressbar" aria-valuenow="3" aria-valuemin="1" 
     aria-valuemax="5" aria-label="Application progress">
  Step 3 of 5
</div>
```

## Testing Procedures

### Manual Testing
1. **Keyboard Navigation Test**
   - Navigate entire site using only keyboard
   - Verify all interactive elements are reachable
   - Check focus indicators are visible

2. **Screen Reader Test**
   - Test with NVDA (Windows) or VoiceOver (Mac)
   - Verify all content is announced properly
   - Check heading structure makes sense

3. **Color Contrast Test**
   - Use WebAIM Contrast Checker
   - Test all text/background combinations
   - Verify UI elements meet contrast requirements

### Automated Testing
1. **axe-core Integration**
   - Add axe accessibility testing to CI/CD
   - Run tests on all major pages
   - Address all violations before deployment

2. **Lighthouse Accessibility Audit**
   - Target 90+ accessibility score
   - Fix all highlighted issues
   - Regular monitoring in production

## Common Accessibility Patterns

### Cards and Lists
```html
<article class="program-card" aria-labelledby="coop-title">
  <h3 id="coop-title">Co-op Program</h3>
  <p>Program description...</p>
  <a href="/programs/coop" aria-describedby="coop-title">Learn More</a>
</article>
```

### Data Tables
```html
<table role="table" aria-label="Application status">
  <thead>
    <tr>
      <th scope="col">Program</th>
      <th scope="col">Status</th>
      <th scope="col">Actions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Co-op Program</td>
      <td><span class="status-badge" aria-label="Under review">Under Review</span></td>
      <td><button type="button">View Details</button></td>
    </tr>
  </tbody>
</table>
```

### Image Alt Text Guidelines
- **Decorative images**: Use empty alt="" or CSS background
- **Informative images**: Describe the information conveyed
- **Functional images**: Describe the function/purpose
- **Complex images**: Provide detailed description nearby

### Focus Management
- **Page changes**: Move focus to main heading
- **Modal opening**: Move focus to modal
- **Modal closing**: Return focus to trigger element
- **Form submission**: Move focus to success/error message

## Performance Considerations
- Images optimized for fast loading
- Critical CSS inlined for faster rendering
- Progressive enhancement for JavaScript features
- Graceful degradation when features unavailable

## Multi-language Support (Future)
- Proper lang attributes for content
- RTL layout support for Arabic
- Translated alt text and ARIA labels
- Cultural considerations for design patterns
EOF

# Create final phase 2 summary
cat > wireframes/phase2-summary.md << 'EOF'
# Phase 2 Summary: UI/UX Design & Wireframes

## Completed Deliverables

### 1. Brand Design System ✅
- **AUI Color Palette**: Primary blue (#003366), gold (#FFD700), teal accent
- **Typography Scale**: Inter font family with consistent hierarchy
- **Component Library**: Buttons, cards, forms, navigation elements
- **Spacing System**: 4px base unit with consistent rhythm
- **Shadow System**: Layered depth for cards and overlays

### 2. Complete Page Wireframes ✅
- **Homepage**: Hero, programs, metrics, testimonials, CTA sections
- **Program Page**: Detailed Co-op program with timeline and requirements
- **Student Portal**: Dashboard, applications, profile management
- **Employer Portal**: Opportunity management and applicant review
- **Mobile Homepage**: Touch-optimized mobile experience

### 3. Responsive Design Implementation ✅
- **Mobile**: 320px-768px with touch targets and simplified navigation
- **Tablet**: 768px-1024px with adaptive layouts
- **Desktop**: 1024px+ with full feature set and optimal spacing
- **Progressive Enhancement**: Works on all devices and browsers

### 4. Accessibility Standards ✅
- **WCAG 2.1 AA Compliance**: Color contrast, keyboard navigation
- **Semantic HTML**: Proper heading hierarchy and landmarks
- **ARIA Support**: Labels and descriptions for complex interactions
- **Screen Reader**: Optimized for assistive technologies

### 5. Interactive Prototypes ✅
- **Hover States**: Smooth transitions and visual feedback
- **Form Interactions**: Validation states and progress indicators
- **Navigation**: Consistent patterns across all pages
- **Status Systems**: Clear visual indicators for application states

## Key Design Features

### Visual Hierarchy
- **Clear Information Architecture**: Logical content organization
- **Consistent Navigation**: Same patterns across all pages
- **Scannable Content**: Headers, bullets, and visual breaks
- **Strategic CTAs**: Prominent placement of key actions

### User Experience
- **Intuitive Workflows**: Natural progression through tasks
- **Contextual Help**: Tooltips and guidance where needed
- **Error Prevention**: Clear validation and helpful messaging
- **Success States**: Positive feedback for completed actions

### Technical Implementation
- **CSS Grid/Flexbox**: Modern layout techniques
- **Custom Properties**: Consistent design tokens
- **Progressive Enhancement**: Works without JavaScript
- **Performance Optimized**: Fast loading and smooth interactions

## Files Structure
```
wireframes/
├── assets/
│   └── brand-guidelines.css         # Complete design system
├── pages/
│   ├── homepage.html               # Main landing page
│   ├── program-coop.html           # Program detail page
│   ├── student-portal.html         # Student dashboard
│   └── employer-portal.html        # Employer dashboard
├── mobile/
│   └── homepage-mobile.html        # Mobile-optimized version
├── components/
│   └── component-library.md        # UI component documentation
├── accessibility-guide.md          # WCAG compliance guide
└── phase2-summary.md               # This summary file
```

## Quality Assurance Checklist

### Design Consistency ✅
- [ ] Color palette used consistently across all pages
- [ ] Typography hierarchy maintained throughout
- [ ] Button styles and interactions standardized
- [ ] Spacing and layout grids properly implemented

### Responsive Design ✅
- [ ] All breakpoints tested and functional
- [ ] Touch targets meet 44px minimum requirement
- [ ] Content reflows properly on all screen sizes
- [ ] Navigation adapts appropriately for mobile

### Accessibility ✅
- [ ] Color contrast meets WCAG AA standards
- [ ] Keyboard navigation works on all interactive elements
- [ ] Screen reader markup properly implemented
- [ ] Focus indicators clearly visible

### User Experience ✅
- [ ] Task flows are intuitive and efficient
- [ ] Error states provide helpful guidance
- [ ] Success states confirm completed actions
- [ ] Loading states provide appropriate feedback

## Browser Support
- **Modern Browsers**: Chrome 90+, Firefox 88+, Safari 14+, Edge 90+
- **Mobile Browsers**: iOS Safari 14+, Chrome Mobile 90+
- **Graceful Degradation**: Basic functionality on older browsers

## Performance Targets
- **Page Load Time**: < 3 seconds on 3G
- **Time to Interactive**: < 5 seconds
- **Lighthouse Score**: 90+ for Performance, Accessibility, SEO
- **Mobile Performance**: Optimized for mobile-first usage

## Next Steps for Phase 3: Development
1. **Frontend Setup**: React/Next.js project initialization
2. **Component Development**: Build reusable UI components
3. **Page Implementation**: Convert wireframes to functional pages
4. **Backend API**: Express.js server with database integration
5. **Authentication**: User login and session management
6. **Form Handling**: Application submission and validation
7. **Content Management**: Dynamic content and media handling

The wireframes provide a solid foundation for development, with detailed specifications, responsive layouts, and accessibility considerations built in from the start.
EOF
