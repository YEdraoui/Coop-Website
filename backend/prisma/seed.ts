import { PrismaClient } from '@prisma/client';
import bcrypt from 'bcryptjs';

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

  console.log('✅ Database seed completed successfully!');
  console.log('🔐 Test account: admin@aui.ma / admin123');
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
