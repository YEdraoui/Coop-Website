# WIL.AUI.MA System Architecture

## High-Level Architecture
```
[Frontend (React/Next.js)] <-> [Backend API (Express.js)] <-> [Database]
                |                       |
        [Static Assets]         [External APIs]
                |                       |
          [CDN/Storage]          [Email Service]
```

## Key Components
1. **Frontend Application**: User-facing web interface
2. **Backend API**: RESTful API server
3. **Database**: Student, employer, and program data
4. **Content Management**: Static content and assets
5. **Authentication**: JWT-based auth system

## User Roles & Permissions
- **Anonymous**: View public pages, browse programs
- **Student**: Apply to programs, view dashboard
- **Employer**: Register, post opportunities
- **Admin**: Full system access, analytics

## Data Models
- Users (students, employers, admins)
- Programs (co-op, remote, alternance)
- Applications
- Companies/Partners
- Metrics/Analytics
