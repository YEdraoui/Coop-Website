# WIL.AUI.MA Development Guide

## 🚀 Quick Start

### 1. Install Dependencies
```bash
npm run setup
```

### 2. Start Development Servers
```bash
npm run dev
```

This will start:
- Frontend: http://localhost:3000
- Backend API: http://localhost:3001

## 🔧 Development Commands

### Full Platform
- `npm run dev` - Start both frontend and backend in development mode
- `npm run build` - Build both frontend and backend for production
- `npm run setup` - Install all dependencies and setup database

### Frontend (Next.js)
- `npm run dev:frontend` - Start frontend development server
- `npm run build:frontend` - Build frontend for production

### Backend (Express.js)
- `npm run dev:backend` - Start backend development server
- `npm run build:backend` - Build backend TypeScript to JavaScript

### Database (Prisma)
- `npm run db:setup` - Initialize database and seed with sample data
- `npm run db:seed` - Seed database with sample data
- `npm run db:studio` - Open Prisma Studio database browser
- `npm run db:reset` - Reset database and reseed

## 🔐 Test Accounts

After running setup, you can login with:

### Admin Account
- **Email:** admin@aui.ma
- **Password:** admin123
- **Access:** Full platform administration

## 📁 Project Structure

```
wil-aui-platform/
├── frontend/                 # Next.js React application
│   ├── src/
│   │   ├── app/             # Next.js 13+ app directory
│   │   └── components/      # Reusable UI components
│   └── package.json
├── backend/                 # Express.js API server
│   ├── src/
│   │   ├── routes/          # API route handlers
│   │   ├── middleware/      # Express middleware
│   │   └── utils/           # Backend utilities
│   ├── prisma/              # Database schema and migrations
│   └── package.json
├── docs/                    # Project documentation
├── wireframes/              # UI/UX wireframes and prototypes
└── package.json             # Root package.json for scripts
```

## 🔧 Technology Stack

### Frontend
- **Framework:** Next.js 14 (React 18)
- **Styling:** Tailwind CSS
- **TypeScript:** Full type safety

### Backend
- **Framework:** Express.js with TypeScript
- **Database:** SQLite (development) / PostgreSQL (production)
- **ORM:** Prisma
- **Authentication:** JWT tokens

## 🔍 API Endpoints

### Health Check
- `GET /api/health` - Server health status

### Programs
- `GET /api/programs` - List all programs

### Contact
- `POST /api/contact` - Submit contact form

## 🎨 Frontend Features

### Homepage
- Hero section with call-to-action
- Program showcase cards
- Impact metrics display
- Contact information

### Responsive Design
- Mobile-first approach
- Tailwind CSS utility classes
- AUI brand colors and typography

## 🚀 Deployment

### Environment Setup
1. Copy backend/.env.example to backend/.env
2. Configure database and JWT settings
3. Set up email configuration for production

### Build for Production
```bash
npm run build
```

### Start Production Servers
```bash
npm run start
```

## 🐛 Troubleshooting

### Port Conflicts
If ports 3000 or 3001 are in use:
```bash
# Kill processes on specific ports (macOS/Linux)
sudo lsof -ti:3000 | xargs kill -9
sudo lsof -ti:3001 | xargs kill -9
```

### Database Issues
```bash
# Reset database completely
npm run db:reset

# Check database status
npm run db:studio
```

### Package Installation Issues
```bash
# Clear npm cache
npm cache clean --force

# Remove node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

## 📈 Next Development Steps

1. **Authentication System** - Add user login and registration
2. **Student Portal** - Build student dashboard and applications
3. **Employer Portal** - Create employer interface
4. **Admin Panel** - Build comprehensive admin interface
5. **Advanced Search** - Add filtering and search functionality
6. **Email System** - Implement email notifications
7. **File Upload** - Add document upload functionality
8. **Testing** - Add unit and integration tests

Happy coding! 🚀
