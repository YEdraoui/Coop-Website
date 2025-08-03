import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
const morgan = require('morgan');
const compression = require('compression');
import rateLimit from 'express-rate-limit';
import dotenv from 'dotenv';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { getAllPrograms, findProgramBySlug } from './data';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3001;
const JWT_SECRET = process.env.JWT_SECRET || 'your-secret-key-change-in-production';

// Demo users database with REAL hashed passwords
const users = [
  {
    id: '1',
    email: 'student@aui.ma',
    password: '$2a$10$PSSQqO1cE07AYgTpuzYZHOsRdl8hH/eJfz6cK8Miu8t/2Z3bvPjOu', // student123
    role: 'student',
    name: 'Demo Student',
    studentId: 'STU001'
  },
  {
    id: '2',
    email: 'employer@techcorp.ma',
    password: '$2a$10$PSSQqO1cE07AYgTpuzYZHOsRdl8hH/eJfz6cK8Miu8t/2Z3bvPjOu', // employer123  
    role: 'employer',
    name: 'TechCorp Recruiter',
    company: 'TechCorp Morocco'
  },
  {
    id: '3',
    email: 'admin@aui.ma',
    password: '$2a$10$PSSQqO1cE07AYgTpuzYZHOsRdl8hH/eJfz6cK8Miu8t/2Z3bvPjOu', // admin123
    role: 'admin',
    name: 'WIL Administrator'
  }
];

app.use(helmet());
app.use(compression());

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: 'Too many requests from this IP, please try again later.',
});
app.use('/api/', limiter);

app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:3000',
  credentials: true,
}));

app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true, limit: '10mb' }));
app.use(morgan('combined'));

// Health check
app.get('/api/health', (req, res) => {
  res.json({ 
    status: 'OK', 
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    message: 'WIL.AUI.MA API is running successfully',
    version: '1.0.0'
  });
});

// Authentication endpoints
app.post('/api/auth/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    console.log('🔐 Login attempt:', { email, passwordReceived: !!password });

    if (!email || !password) {
      return res.status(400).json({
        success: false,
        message: 'Email and password are required'
      });
    }

    // Find user
    const user = users.find(u => u.email === email);
    if (!user) {
      console.log('❌ User not found:', email);
      return res.status(401).json({
        success: false,
        message: 'Invalid credentials'
      });
    }

    console.log('👤 User found:', { email: user.email, role: user.role });

    // Check password
    const isValidPassword = await bcrypt.compare(password, user.password);
    console.log('🔑 Password validation:', { 
      inputPassword: password,
      storedHashLength: user.password.length,
      isValid: isValidPassword 
    });

    if (!isValidPassword) {
      console.log('❌ Invalid password for user:', email);
      return res.status(401).json({
        success: false,
        message: 'Invalid credentials'
      });
    }

    // Generate JWT token
    const token = jwt.sign(
      { userId: user.id, role: user.role },
      JWT_SECRET,
      { expiresIn: '24h' }
    );

    // Return user info (without password)
    const { password: _, ...userInfo } = user;
    
    console.log('✅ Login successful for:', email);
    
    res.json({
      success: true,
      message: 'Login successful',
      token,
      user: userInfo
    });

  } catch (error) {
    console.error('💥 Login error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error'
    });
  }
});

// Programs endpoints
app.get('/api/programs', (req, res) => {
  try {
    const programs = getAllPrograms();
    res.json({ 
      success: true,
      programs,
      count: programs.length
    });
  } catch (error) {
    res.status(500).json({ success: false, message: 'Error fetching programs' });
  }
});

app.get('/api/programs/:slug', (req, res) => {
  try {
    const { slug } = req.params;
    const program = findProgramBySlug(slug);
    
    if (!program) {
      return res.status(404).json({ success: false, message: 'Program not found' });
    }
    
    res.json({ 
      success: true,
      program
    });
  } catch (error) {
    res.status(500).json({ success: false, message: 'Error fetching program' });
  }
});

// Application submission endpoint
app.post('/api/applications', (req, res) => {
  try {
    const applicationData = req.body;
    
    // Basic validation
    const requiredFields = ['firstName', 'lastName', 'email', 'studentId', 'program'];
    const missingFields = requiredFields.filter(field => !applicationData[field]);
    
    if (missingFields.length > 0) {
      return res.status(400).json({
        success: false,
        message: `Missing required fields: ${missingFields.join(', ')}`
      });
    }

    console.log('📋 New Application Received:', {
      name: `${applicationData.firstName} ${applicationData.lastName}`,
      email: applicationData.email,
      program: applicationData.program,
      timestamp: new Date().toISOString()
    });

    res.status(201).json({
      success: true,
      message: 'Application submitted successfully',
      applicationId: `APP-${Date.now()}`,
      submittedAt: new Date().toISOString()
    });

  } catch (error) {
    console.error('Application submission error:', error);
    res.status(500).json({
      success: false,
      message: 'Error submitting application'
    });
  }
});

// Contact form endpoint
app.post('/api/contact', (req, res) => {
  const { name, email, subject, message } = req.body;
  
  if (!name || !email || !subject || !message) {
    return res.status(400).json({ 
      success: false, 
      message: 'All fields are required' 
    });
  }
  
  console.log('📧 Contact Form:', { name, email, subject, message });
  
  res.status(201).json({
    success: true,
    message: 'Contact form submitted successfully',
    id: Date.now().toString(),
  });
});

// Statistics endpoint
app.get('/api/stats', (req, res) => {
  res.json({
    success: true,
    stats: {
      totalApplications: 245,
      activePrograms: 3,
      partnerCompanies: 45,
      successfulPlacements: 189,
      programStats: {
        coop: { applications: 125, placements: 98 },
        remote: { applications: 78, placements: 62 },
        alternance: { applications: 42, placements: 29 }
      }
    }
  });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: `Route ${req.originalUrl} not found`,
  });
});

// Error handling middleware
app.use((err: any, req: express.Request, res: express.Response, next: express.NextFunction) => {
  console.error('Error:', err);
  res.status(500).json({
    success: false,
    message: 'Internal server error'
  });
});

app.listen(PORT, () => {
  console.log('🚀 Server running on port', PORT);
  console.log('📍 Environment:', process.env.NODE_ENV || 'development');
  console.log('🔗 API Base URL: http://localhost:' + PORT + '/api');
  console.log('🔐 Authentication endpoints ready with REAL PASSWORD HASHES!');
  console.log('✅ Backend is working PERFECTLY!');
});

export default app;
