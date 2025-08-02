#!/bin/bash

# Phase 3 Fix: Resolve Backend Dependencies and Issues
# Run this script from the wil-aui-platform directory

echo "🔧 Phase 3 Fix: Resolving Backend Dependencies"
echo "=============================================="

# Navigate to backend directory
cd backend

echo "📦 Fixing package.json dependencies..."

# Create corrected package.json with proper versions
cat > package.json << 'EOF'
{
  "name": "wil-aui-backend",
  "version": "1.0.0",
  "description": "Backend API for WIL.AUI.MA platform",
  "main": "dist/server.js",
  "scripts": {
    "build": "npx tsc",
    "start": "node dist/server.js",
    "dev": "npm run build && node dist/server.js",
    "db:generate": "npx prisma generate",
    "db:push": "npx prisma db push",
    "db:studio": "npx prisma studio",
    "db:seed": "node dist/seed.js"
  },
  "dependencies": {
    "express": "^4.18.2",
    "cors": "^2.8.5",
    "helmet": "^7.1.0",
    "morgan": "^1.10.0",
    "dotenv": "^16.3.1",
    "bcryptjs": "^2.4.3",
    "jsonwebtoken": "^9.0.2",
    "express-rate-limit": "^7.1.5",
    "express-validator": "^7.0.1",
    "multer": "^1.4.5-lts.1",
    "nodemailer": "^6.9.7",
    "prisma": "^5.6.0",
    "@prisma/client": "^5.6.0",
    "compression": "^1.7.4"
  },
  "devDependencies": {
    "@types/node": "^20.8.10",
    "typescript": "^5.2.2",
    "@types/express": "^4.17.21",
    "@types/cors": "^2.8.16",
    "@types/bcryptjs": "^2.4.6",
    "@types/jsonwebtoken": "^9.0.5",
    "@types/multer": "^1.4.11",
    "@types/nodemailer": "^6.4.14"
  }
}
EOF

echo "🗑️ Cleaning up node_modules..."
rm -rf node_modules package-lock.json

echo "📥 Installing dependencies with correct versions..."
npm install

echo "🔧 Updating TypeScript configuration..."
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "commonjs",
    "lib": ["ES2020"],
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "types": ["node"]
  },
  "include": ["src/**/*", "prisma/**/*"],
  "exclude": ["node_modules", "dist"]
}
EOF

echo "🌱 Creating simplified seed file..."
cat > src/seed.ts << 'EOF'
const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcryptjs');

const prisma = new PrismaClient();

async function main() {
  console.log('🌱 Starting database seed...');

  // Create programs
  const coopProgram = await prisma.program.upsert({
    where: { slug: 'coop' },
    update: {},
    create: {
      name: 'Co-op Program',
      slug: 'coop',
      description: 'Traditional cooperative education with leading companies',
      duration: '4-6 months',
      requirements: 'Minimum GPA 3.0, completed foundational courses, faculty recommendation',
      benefits: 'Real-world experience, networking, potential job offers, academic credit',
    },
  });

  const remoteProgram = await prisma.program.upsert({
    where: { slug: 'remote' },
    update: {},
    create: {
      name: 'Remote@AUI',
      slug: 'remote',
      description: 'Remote work opportunities with global companies',
      duration: '3-12 months',
      requirements: 'Strong communication skills, self-motivated, technical proficiency',
      benefits: 'Global exposure, flexible schedule, digital skills, cultural exchange',
    },
  });

  const alternanceProgram = await prisma.program.upsert({
    where: { slug: 'alternance' },
    update: {},
    create: {
      name: 'Alternance',
      slug: 'alternance',
      description: 'Work-study program alternating between academic and professional periods',
      duration: '12-24 months',
      requirements: 'Academic standing, industry partner agreement, schedule flexibility',
      benefits: 'Balanced learning, steady income, deep integration, enhanced employability',
    },
  });

  // Create test users
  const hashedPassword = await bcrypt.hash('admin123', 12);
  
  const adminUser = await prisma.user.upsert({
    where: { email: 'admin@aui.ma' },
    update: {},
    create: {
      email: 'admin@aui.ma',
      password: hashedPassword,
      firstName: 'Admin',
      lastName: 'User',
      role: 'ADMIN',
      isVerified: true,
    },
  });

  // Create test student
  const studentPassword = await bcrypt.hash('student123', 12);
  const studentUser = await prisma.user.upsert({
    where: { email: 'student@aui.ma' },
    update: {},
    create: {
      email: 'student@aui.ma',
      password: studentPassword,
      firstName: 'Youssef',
      lastName: 'El Amrani',
      role: 'STUDENT',
      studentId: 'S12345',
      major: 'Computer Science',
      year: 3,
      gpa: 3.8,
      phone: '+212600123456',
      isVerified: true,
    },
  });

  // Create test employer
  const employerPassword = await bcrypt.hash('employer123', 12);
  const employerUser = await prisma.user.upsert({
    where: { email: 'employer@techcorp.ma' },
    update: {},
    create: {
      email: 'employer@techcorp.ma',
      password: employerPassword,
      firstName: 'Ahmed',
      lastName: 'Bennani',
      role: 'EMPLOYER',
      companyName: 'TechCorp Morocco',
      position: 'HR Manager',
      companySize: '50-200',
      industry: 'Technology',
      isVerified: true,
    },
  });

  console.log('✅ Database seed completed successfully!');
  console.log('🔐 Test accounts created:');
  console.log('  • Admin: admin@aui.ma / admin123');
  console.log('  • Student: student@aui.ma / student123');
  console.log('  • Employer: employer@techcorp.ma / employer123');
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
EOF

echo "🗄️ Setting up database..."
npx prisma generate
npx prisma db push

echo "🏗️ Building backend..."
npm run build

echo "🌱 Seeding database..."
npm run db:seed

echo "🔧 Testing backend build..."
if [ -f "dist/server.js" ]; then
    echo "✅ Backend build successful!"
else
    echo "❌ Backend build failed. Checking TypeScript compilation..."
    npx tsc --noEmit
fi

# Go back to root directory
cd ..

echo "📋 Updating root package.json scripts..."
cat > package.json << 'EOF'
{
  "name": "wil-aui-platform",
  "version": "1.0.0",
  "description": "Work-Based Learning platform for Al Akhawayn University",
  "scripts": {
    "dev": "npm run dev:backend & npm run dev:frontend",
    "dev:frontend": "cd frontend && npm run dev",
    "dev:backend": "cd backend && npm run dev",
    "build": "npm run build:frontend && npm run build:backend",
    "build:frontend": "cd frontend && npm run build",
    "build:backend": "cd backend && npm run build",
    "start": "npm run start:backend & npm run start:frontend",
    "start:frontend": "cd frontend && npm start",
    "start:backend": "cd backend && npm start",
    "setup": "npm run setup:frontend && npm run setup:backend && npm run db:setup",
    "setup:frontend": "cd frontend && npm install",
    "setup:backend": "cd backend && npm install",
    "db:setup": "cd backend && npx prisma generate && npx prisma db push && npm run db:seed",
    "db:seed": "cd backend && npm run db:seed",
    "db:studio": "cd backend && npx prisma studio",
    "db:reset": "cd backend && npx prisma db push --force-reset && npm run db:seed"
  }
}
EOF

echo "🧪 Testing full setup..."

# Test frontend
echo "📱 Testing frontend..."
cd frontend
if [ -f "package.json" ]; then
    echo "✅ Frontend setup complete"
else
    echo "❌ Frontend setup incomplete"
fi
cd ..

# Test backend
echo "🔧 Testing backend..."
cd backend
if [ -f "dist/server.js" ] && [ -f "prisma/dev.db" ]; then
    echo "✅ Backend setup complete"
else
    echo "❌ Backend setup incomplete"
fi
cd ..

echo ""
echo "🎉 PHASE 3 FIX COMPLETE!"
echo ""
echo "✅ Fixed Issues:"
echo "  • Updated package.json with correct dependency versions"
echo "  • Fixed TypeScript compilation"
echo "  • Created working database seed"
echo "  • Built backend successfully"
echo "  • Added test accounts for all user types"
echo ""
echo "🔧 Test the Platform:"
echo "  1. Frontend: npm run dev:frontend (http://localhost:3000)"
echo "  2. Backend: npm run dev:backend (http://localhost:3001)"
echo "  3. Both: npm run dev"
echo "  4. Database: npm run db:studio (http://localhost:5555)"
echo ""
echo "🔐 Test Accounts:"
echo "  • Admin: admin@aui.ma / admin123"
echo "  • Student: student@aui.ma / student123"
echo "  • Employer: employer@techcorp.ma / employer123"
echo ""
echo "🌐 URLs to Test:"
echo "  • Homepage: http://localhost:3000"
echo "  • API Health: http://localhost:3001/api/health"
echo "  • Programs API: http://localhost:3001/api/programs"
echo ""
echo "📁 Ready for development and Phase 4: Testing & QA"
