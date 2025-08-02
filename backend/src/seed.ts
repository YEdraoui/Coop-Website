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
